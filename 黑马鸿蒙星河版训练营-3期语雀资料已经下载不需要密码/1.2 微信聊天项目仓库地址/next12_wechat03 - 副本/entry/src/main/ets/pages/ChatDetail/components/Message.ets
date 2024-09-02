import { MessageInfo, MessageInfoModel, MessageTypeEnum } from '../../../models/message'
import { PopupItem } from '../../../models/popup'
import { currentUser } from '../../../models/users'
import { AudioRender } from '../../../utils/AudioRender'
import { AVPlayerClass } from '../../../utils/AVPlayerClass'
import { FileOperate } from '../../../utils/FileOperate'
import { StoreClass } from '../../../utils/StoreClass'
import { VoiceTransfer } from '../../../utils/VoiceTransfer'

@Component
@Preview
struct Message {
  @State
  showPopup: boolean = false
  item: MessageInfoModel = new MessageInfoModel({} as MessageInfo)
  @State
  transferResult:string = ''
  @State
  popupList: PopupItem[] = [
    {
      title: '听筒播放',
      icon: $r("app.media.ic_public_ears"),
      itemClick:()=>{
        if(this.item.messageType === MessageTypeEnum.TEXT){
          VoiceTransfer.textToVoice(this.item.messageContent)
        }
      }
    },
    {
      title: '收藏',
      icon: $r("app.media.ic_public_cube")
    },
    {
      title: '转文字',
      icon: $r("app.media.ic_public_trans_text"),
      itemClick:()=>{
        if(this.item.messageType === MessageTypeEnum.AUDIO){
          VoiceTransfer.voiceToText(this.item.sourceFilePath,(result)=>{
              this.transferResult = result.result
          })
        }
        this.showPopup = false
      }
    },
    {
      title: '删除',
      icon: $r("app.media.ic_public_cancel"),
      itemClick: () => {
        // 如果有资源，连资源也删了
        if(this.item.sourceFilePath){
            FileOperate.delFilePath(this.item.sourceFilePath)
        }
        // 删除的首选项
        StoreClass.removeChatMessage(this.item.connectUser.user_id, this.item.id)
        //   删除UI列表
        this.delMessage(this.item.id)
      }
    },
    {
      title: '多选',
      icon: $r("app.media.ic_public_multi_select")
    },
    {
      title: '引用',
      icon: $r("app.media.ic_public_link")
    },
    {
      title: '提醒',
      icon: $r("app.media.ic_public_warin")
    }
  ]
  @State
  audioState: AnimationStatus = AnimationStatus.Initial

  @Builder
  getContent() {
    GridRow({ columns: 5 }) {
      ForEach(this.popupList, (item: PopupItem) => {
        GridCol() {
          Column({ space: 6 }) {
            Image(item.icon)
              .width(18)
              .aspectRatio(1)
              .fillColor($r('app.color.white'))
            Text(item.title)
              .fontSize(14)
              .fontColor($r('app.color.white'))
          }
          .margin({
            bottom: 6
          })
        }
        .onClick(() => {
          // A && B  如果a不存在就不会往后执行了
          item.itemClick && item.itemClick()
        })
      })
    }
    .width(300)
    .padding(15)
  }

  // 文字消息
  @Builder
  getTextContent() {
    Text(this.item.messageContent)// .backgroundColor()
      .backgroundColor(this.item.sendUser.user_id === currentUser.user_id ? $r('app.color.second_primary') : $r('app.color.white'))
      .fontColor($r('app.color.text_primary'))
      .padding(10)
      .lineHeight(24)
      .margin({
        left: 10,
        right: 10
      })
      .borderRadius(4)
  }

  // 计算语音消息的长度
  getAudioWidth() {
    let minWidth: number = 20
    let maxWidth: number = 90
    let calWidth: number = minWidth + (100 * this.item.sourceDuration / 60)
    if (calWidth > maxWidth) return maxWidth + '%'
    return calWidth + '%'
  }

  // 语音消息
  @Builder
  getVoiceContent() {
    Column(){
      Row({ space: 5 }) {
        Text(`${this.item.sourceDuration}"`)
          .textAlign(TextAlign.Center)
        ImageAnimator()
          .images([
            {
              src: $r('app.media.ic_public_voice3')
            },
            {
              src: $r('app.media.ic_public_voice1')
            },
            {
              src: $r('app.media.ic_public_voice2')
            },
            {
              src: $r('app.media.ic_public_voice3')
            }
          ])
          .iterations(-1)
          .state(this.audioState)
          .duration(300)
          .fillMode(FillMode.None)
          .width(20)
          .height(20)
          .rotate({
            angle: currentUser.user_id === this.item.sendUser.user_id ? 180 : 0
          })
      }
      .width(this.getAudioWidth())
      .backgroundColor(currentUser.user_id === this.item.sendUser.user_id ? $r('app.color.chat_primary') : $r('app.color.white'))
      .justifyContent(currentUser.user_id === this.item.sendUser.user_id ? FlexAlign.End : FlexAlign.Start)
      .height(40)
      .padding({
        left: 10,
        right: 10
      })
      .margin({
        left: 10,
        right: 10
      })
      .borderRadius(4)
      .direction(currentUser.user_id === this.item.sendUser.user_id ? Direction.Ltr : Direction.Rtl)
      .onClick(() => {
        AudioRender.start(this.item.sourceFilePath,()=>{
          this.audioState = AnimationStatus.Running
        },()=>{
          this.audioState = AnimationStatus.Stopped
        })
      })
      if(this.transferResult){
        Text(this.transferResult)
      }
    }
    .alignItems(currentUser.user_id===this.item.sendUser.user_id?HorizontalAlign.End:HorizontalAlign.Start)
  }

  // 图片消息
  @Builder
  getImageContent(){
    Column(){
      Image("file://"+this.item.sourceFilePath)
        .width('100%')
        .borderRadius(4)
    }.width('40%')
    .margin({
      left:10,
      right:10
    })
    .onClick(()=>{
      this.previewImage()
    })
  }
  // 预览图片
  previewImage:()=>void = ()=>{}
  // 视频消息
  videoController:VideoController = new VideoController()
  @Builder
  getVideoContent(){
    Column(){
      Stack(){
        Video({
          src:'file://'+this.item.sourceFilePath,
          controller:this.videoController
        })
          .controls(false)
          .width(100)
          .height(150)
          .borderRadius(4)
          .id(this.item.id)
          .onPrepared(()=>{
            this.videoController.setCurrentTime(0.1)
          })
        Image($r('app.media.ic_public_play'))
          .width(30)
          .height(30)
          .fillColor($r('app.color.back_color'))
      }
    }.margin({
      left:10,
      right:10
    })
    .onClick(()=>{
      this.previewImage()
    })
  }
  // 位置消息

  // 删除消息
  delMessage: (id: string) => void = () => {
  }

  build() {
    Row() {
      Image(this.item.sendUser.avatar)
        .width(40)
        .layoutWeight(1)
        .borderRadius(6)
      Row() {
        Column() {
          // 消息类型渲染
          if (this.item.messageType === MessageTypeEnum.TEXT) {
            this.getTextContent()
          } else if (this.item.messageType === MessageTypeEnum.AUDIO) {
            this.getVoiceContent()
          }else if (this.item.messageType === MessageTypeEnum.IMAGE) {
            this.getImageContent()
          }else if(this.item.messageType===MessageTypeEnum.VIDEO){
            this.getVideoContent()
          }
        }.bindPopup(this.showPopup, {
          builder: this.getContent(),
          popupColor: $r('app.color.popup_back'),
          // 背景失焦样式控制
          backgroundBlurStyle: BlurStyle.NONE,
          onStateChange: (event) => {
            // 手指点击其他位置进行关闭
            this.showPopup = event.isVisible
          }
        })
      }
      .layoutWeight(6)
      // .justifyContent(FlexAlign.Start)
      .justifyContent(this.item.sendUser.user_id === currentUser.user_id ? FlexAlign.End : FlexAlign.Start)

      Text().layoutWeight(1)
    }
    .width('100%')
    .padding({
      left: 10,
      right: 10
    })
    // .direction(Direction.Ltr)
    .direction(this.item.sendUser.user_id === currentUser.user_id ? Direction.Rtl : Direction.Ltr)
    .gesture(
      LongPressGesture()
        .onAction(() => {
          this.showPopup = true
        })
    )
  }
}

export default Message