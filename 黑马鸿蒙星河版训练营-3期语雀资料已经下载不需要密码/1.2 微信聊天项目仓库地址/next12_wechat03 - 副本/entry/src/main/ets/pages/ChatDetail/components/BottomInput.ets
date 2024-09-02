import { VoiceRecordEnum } from '../../../models/voice'
import VoiceInput from './VoiceInput'
import { display, promptAction } from '@kit.ArkUI'
import { abilityAccessCtrl, bundleManager, common } from '@kit.AbilityKit'
import { AudioCapturer } from '../../../utils/AudioCapturer'
import { FileOperate } from '../../../utils/FileOperate'
import { currentUser, UserInfo } from '../../../models/users'
import { MessageInfo, MessageInfoModel, MessageTypeEnum } from '../../../models/message'
import { PopupItem } from '../../../models/popup'
import { fileIo, picker } from '@kit.CoreFileKit'
import { camera, cameraPicker } from '@kit.CameraKit'
import Location from './Location'
import { VoiceTransfer } from '../../../utils/VoiceTransfer'

@Component
@Preview
struct BottomInput {
  @State
  showVoice: boolean = false
  @State
  content: string = ''
  @State
  showVoiceComp: boolean = false
  // 声明语音录制状态
  @Provide
  // 默认：录制中
  voiceState: VoiceRecordEnum = VoiceRecordEnum.Recording
  screenWidth: number = 0
  screenHeight: number = 0
  // 组件方法
  // sendTextMessage(){}
  // 属性：是可以接收传值（重写）
  // 发送文字消息
  sendTextMessage: (content: string) => void = () => {
  }
  // 发送语音消息
  sendVoiceMessage: (message: MessageInfoModel) => void = () => {
  }
  // 发送图片消息
  sendImageMessage: (messageList: MessageInfoModel[]) => void = () => {
  }
  @Prop
  talker: UserInfo
  // 用于记录当前语音消息路径的（可能需要删除）
  @State
  filePath: string = ''
  timer: number = -1
  duration: number = 0
  @State
  showLocation: boolean = false
  @State
  bottomList: PopupItem[] = [
    {
      icon: $r('app.media.ic_public_photo'),
      title: '照片',
      itemClick: () => {
        this.sendPhoto()
      }
    }, {
    icon: $r('app.media.ic_public_carema'),
    title: '拍摄',
    itemClick: () => {
      this.openCamera()
    }

  }, {
    icon: $r('app.media.ic_statusbar_gps'),
    title: '位置',
    itemClick: () => {
      this.showLocation = true
    }

  }, {
    icon: $r('app.media.ic_public_voice'),
    title: '语音输入',

  }, {
    icon: $r("app.media.ic_public_collect"),
    title: '收藏',

  }, {
    icon: $r("app.media.ic_public_contacts_filled"),
    title: '个人名片',

  }, {
    icon: $r("app.media.ic_public_folder_filled"),
    title: '文件',

  }, {
    icon: $r("app.media.ic_public_music_filled"),
    title: '音乐',
  }]
  @State
  showBottomCard: boolean = false // 显示底部
  @State
  currentAddress: string = ''
  @Provide
  transText: string = ''

  @Builder
  voiceBuilder() {
    // builder内部不能直接放置自定义组件，需要放置内置组件
    Column() {
      VoiceInput()
    }
  }

  @Builder
  getBottomCard(item: PopupItem) {
    Column() {
      Column() {
        Image(item.icon)
          .width(30)
          .height(30)
          .fillColor("#4c4c4c")
      }
      .backgroundColor(Color.White)
      .width(56)
      .aspectRatio(1)
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Text(item.title)
        .fontSize(12)
        .fontColor($r('app.color.text_second'))
        .margin({
          top: 10
        })
    }.layoutWeight(1)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      item.itemClick && item.itemClick()
    })
  }

  @Builder
  getLocationContent() {
    Stack({ alignContent: Alignment.Top }) {
      // 地图
      Location({
        currentAddress: this.currentAddress
      })
      //   按钮
      Row() {
        Text('取消')
          .fontColor($r('app.color.text_second'))
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.showLocation = false
          })
        Button('发送')
          .type(ButtonType.Normal)
          .borderRadius(4)
          .backgroundColor($r('app.color.pay_back'))
          .fontColor($r('app.color.white'))
          .width(60)
          .height(30)
          .onClick(() => {

            if (this.currentAddress) {
              this.sendTextMessage(this.currentAddress)
            }
            this.currentAddress = ''
            this.showLocation = false
          })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .padding(20)
      .width('100%')
      .margin({
        top: 50
      })
    }
  }

  // 检测权限
  checkPermission() {
    try {
      const manager = abilityAccessCtrl.createAtManager()
      //应用信息
      const bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION)
      const flag = manager.checkAccessTokenSync(bundleInfo.appInfo?.accessTokenId, "ohos.permission.MICROPHONE")
      if (flag === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
        // 有权限
        this.showVoiceComp = true
        this.beginCollectVoice()
      } else {
        // 没权限,跳转应用设置，让用户自己开启权限
        //   原理：打开一个新的ability + 打开系统包的某个页面
        (getContext() as common.UIAbilityContext).startAbility({
          bundleName: 'com.huawei.hmos.settings',
          abilityName: 'com.huawei.hmos.settings.MainAbility',
          uri: 'application_info_entry',
          parameters: {
            pushParams: bundleInfo.name
          }
        })
      }
    } catch (err) {
      AlertDialog.show({
        message: '打开系统设置失败'
      })
    }
  }

  // 开启录音
  beginCollectVoice() {
    this.filePath = FileOperate.createAudioFile(this.talker.user_id)
    this.startTime()
    AudioCapturer.start(this.filePath)
  }

  // 结束录音
  stopCollectVoice() {
    AudioCapturer.stop()
    this.endTime()
  }

  // 开始计时
  startTime() {
    this.timer = setInterval(() => {
      this.duration++
      promptAction.showToast({
        message: `当前语音：${this.duration}秒`
      })
    }, 1000)
  }

  // 结束计时
  endTime() {
    clearInterval(this.timer)
  }

  // 手势检测：到底是否存录音
  releaseFinger() {
    // 先关闭发语音的弹层和停止录音
    this.showVoiceComp = false
    this.stopCollectVoice()
    if (this.voiceState === VoiceRecordEnum.Cancel) {
      //   取消：先删除文件
      FileOperate.delFilePath(this.filePath)
    } else if (this.voiceState === VoiceRecordEnum.Transfer) {
      if(this.transText){
        this.sendTextMessage(this.transText)
      }
      //   转文字
      this.transText = ''
      this.duration = 0

    } else if (this.voiceState === VoiceRecordEnum.Recording) {
      //   录制

      if (this.duration < 1) {
        promptAction.showToast({
          message: '录制时间过短'
        })
        FileOperate.delFilePath(this.filePath)
        return
      }
      // 生成语音消息
      const message = new MessageInfoModel({
        sendUser: currentUser,
        connectUser: this.talker,
        messageContent: `[语音] ${this.duration}"`,
        messageType: MessageTypeEnum.AUDIO,
        sourceFilePath: this.filePath,
        sourceDuration: this.duration
      } as MessageInfo)
      this.sendVoiceMessage(message)
      //清空数据
      this.filePath = ''
      this.duration = 0
    }
    // 将状态恢复至默认状态
    this.voiceState = VoiceRecordEnum.Recording
  }

  // 发送照片
  async sendPhoto() {
    const photo = new picker.PhotoViewPicker()
    const result = await photo.select({
      maxSelectNumber: 9,
      MIMEType: picker.PhotoViewMIMETypes.IMAGE_TYPE
    })
    if (result.photoUris.length) {
      //选中的图拷贝到沙箱
      let imgList: MessageInfoModel[] = []
      result.photoUris.forEach((item) => {
        // 拷贝到沙箱-----START
        const file = fileIo.openSync(item, fileIo.OpenMode.READ_ONLY)
        // 没有目录创建文件是由问题：可以再fileIo新增createImgFile
        let newFileName = getContext().filesDir + '/' + Date.now() + '.jpg'
        fileIo.copyFileSync(file.fd, newFileName)
        // 拷贝到沙箱-----END
        const newMessage = new MessageInfoModel({
          sendUser: currentUser,
          connectUser: this.talker,
          messageContent: '[图片]',
          messageType: MessageTypeEnum.IMAGE,
          sourceFilePath: newFileName
        } as MessageInfo)
        imgList.push(newMessage)
        fileIo.closeSync(file.fd)
      })
      this.sendImageMessage(imgList)
      this.showBottomCard = false
    }
  }

  // 打开相机
  async openCamera() {
    try {
      let pickerProfile: cameraPicker.PickerProfile = {
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK
      }
      let pickerResult = await cameraPicker.pick(getContext(), [
        cameraPicker.PickerMediaType.PHOTO, cameraPicker.PickerMediaType.VIDEO
      ], pickerProfile)
      promptAction.showDialog({
        message: JSON.stringify(pickerResult)
      })
      if (pickerResult.resultUri !== '' && pickerResult.mediaType === 'photo') {
        const newFileName = getContext().filesDir + '/' + Date.now() + '.jpg'
        const file = fileIo.openSync(pickerResult.resultUri, fileIo.OpenMode.READ_ONLY)
        fileIo.copyFileSync(file.fd, newFileName)
        const newMessage = new MessageInfoModel({
          sendUser: currentUser,
          connectUser: this.talker,
          messageContent: '[图片]',
          messageType: MessageTypeEnum.IMAGE,
          sourceFilePath: newFileName
        } as MessageInfo)
        this.sendImageMessage([newMessage])
      } else if (pickerResult.resultUri !== '' && pickerResult.mediaType === 'video') {
        const newFileName = getContext().filesDir + '/' + Date.now() + '.mp4'
        const file = fileIo.openSync(pickerResult.resultUri, fileIo.OpenMode.READ_ONLY)
        fileIo.copyFileSync(file.fd, newFileName)
        const newMessage = new MessageInfoModel({
          sendUser: currentUser,
          connectUser: this.talker,
          messageContent: '[视频]',
          messageType: MessageTypeEnum.VIDEO,
          sourceFilePath: newFileName
        } as MessageInfo)
        this.sendImageMessage([newMessage])
      }
    } catch (err) {
      promptAction.showToast({
        message: '相机打开失败'
      })
    }
  }

  aboutToAppear(): void {
    this.screenWidth = px2vp(display.getDefaultDisplaySync().width)
    this.screenHeight = px2vp(display.getDefaultDisplaySync().height)
    AudioCapturer.init()
  }

  aboutToDisappear(): void {
    AudioCapturer.release()
  }

  build() {
    Column() {
      Row({ space: 10 }) {
        Image(this.showVoice ? $r('app.media.ic_public_keyboard') : $r('app.media.ic_public_sound'))
          .width(25)
          .aspectRatio(1)
          .onClick(() => {
            this.showVoice = !this.showVoice
            if (!this.showVoice) {
              animateTo({ duration: 150 }, () => {
                this.showBottomCard = false
              })
            }
          })
        if (!this.showVoice) {
          TextInput({ text: $$this.content })
            .height(35)
            .layoutWeight(1)
            .borderRadius(2)
            .backgroundColor($r('app.color.white'))
            .id('input')
            .focusable(true)
            .defaultFocus(true)
            .onSubmit(() => {
              this.sendTextMessage(this.content)
              this.content = ''
              focusControl.requestFocus('input')
            })
            .onClick(() => {
              animateTo({ duration: 150 }, () => {
                this.showBottomCard = false
              })
            })
        }
        else {
          Button('按住 说话')
            .type(ButtonType.Normal)
            .backgroundColor($r('app.color.white'))
            .borderRadius(2)
            .fontColor($r('app.color.text_primary'))
            .layoutWeight(1)
            .gesture(
              GestureGroup(GestureMode.Parallel,
                LongPressGesture()
                  .onAction(() => {
                    // this.showVoiceComp = true
                    this.checkPermission()
                  })
                  .onActionEnd(() => {
                    this.releaseFinger()
                  }),
                PanGesture()
                  .onActionUpdate((event) => {
                    if (event.fingerList[0].globalY > this.screenHeight - 120) {
                      //   录制
                      this.voiceState = VoiceRecordEnum.Recording
                    } else {
                      if (event.fingerList[0].globalX > this.screenWidth / 2) {
                        //   转文字
                        this.voiceState = VoiceRecordEnum.Transfer
                        //   调用方法
                        VoiceTransfer.voiceToText(this.filePath,(result)=>{
                            this.transText = result.result
                        })

                      } else {
                        //   取消
                        this.voiceState = VoiceRecordEnum.Cancel
                      }
                    }

                  })
                  .onActionEnd(() => {
                    //     回到默认状态
                    this.voiceState = VoiceRecordEnum.Recording
                  })
              )
            )
        }
        Image($r('app.media.ic_public_add_norm'))
          .width(25)
          .aspectRatio(1)
          .onClick(() => {
            animateTo({ duration: 150 }, () => {
              this.showBottomCard = !this.showBottomCard
            })
          })
      }
      .width('100%')
      .height(60)
      .padding({
        left: 10,
        right: 10
      })
      .bindContentCover($$this.showLocation, this.getLocationContent())

      if (this.showBottomCard) {
        // 底部结构
        GridRow({ columns: 4 }) {
          ForEach(this.bottomList, (item: PopupItem) => {
            GridCol() {
              this.getBottomCard(item)
            }.height(100)
          })
        }
        .width('100%')

      }
    }
    .backgroundColor($r('app.color.second_back_color'))
    .bindContentCover($$this.showVoiceComp, this.voiceBuilder(), {
      modalTransition: ModalTransition.NONE
    })

  }
}

export default BottomInput