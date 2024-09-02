import { router } from '@kit.ArkUI'
import { MessageInfo, MessageInfoModel, MessageTypeEnum } from '../../models/message'
import { currentUser, UserInfo } from '../../models/users'
import { AudioRender } from '../../utils/AudioRender'
import { AVPlayerClass } from '../../utils/AVPlayerClass'
import { requestMessage } from '../../utils/request'
import { StoreClass } from '../../utils/StoreClass'
import BottomInput from './components/BottomInput'
import Message from './components/Message'
import PreviewImage from './components/PreviewImage'

@Entry
@Component
struct ChatDetail {
  @State
  talker: UserInfo = {} as UserInfo
  @State
  messageList: MessageInfoModel[] = []
  @State
  talkerInputIng: boolean = false
  // 不能加@State
  scroller: Scroller = new Scroller()
  // 记录要预览的图片
  previewType:MessageTypeEnum = MessageTypeEnum.IMAGE
  previewUrl: ResourceStr = ''
  previewController: CustomDialogController = new CustomDialogController({
    builder: PreviewImage({
      url: this.previewUrl,
      type:this.previewType
    }),
    autoCancel: false,
    customStyle: true
  })

  // 发送文字消息
  async sendTextMessage(content: string) {
    const message = new MessageInfoModel({
      sendUser: currentUser,
      connectUser: this.talker,
      messageContent: content
    } as MessageInfo)
    this.messageList.push(message)
    await StoreClass.addChatMessage(this.talker.user_id, message)
    this.scroller.scrollEdge(Edge.Bottom)
    AVPlayerClass.play('send')
    this.getResponseMessage(content)
  }

  // 发送语音消息
  async sendVoiceMessage(message: MessageInfoModel) {
    this.messageList.push(message)
    await StoreClass.addChatMessage(this.talker.user_id, message)
    this.scroller.scrollEdge(Edge.Bottom)
    AVPlayerClass.play('send')
    // this.getResponseMessage(message.messageContent)
  }

  // 发送图片消息
  async sendImageMessage(messageList: MessageInfoModel[]) {
    // 鸿蒙中只能对数组使用展开运算符
    // Array.isArray()
    this.messageList.push(...messageList)
    this.scroller.scrollEdge(Edge.Bottom)
    messageList.forEach((message) => {
      StoreClass.addChatMessage(this.talker.user_id, message)
    })
    AVPlayerClass.play('send')
  }

  // 获取机器人消息
  async getResponseMessage(content: string) {
    // 对方正在输入
    this.talkerInputIng = true
    const result = await requestMessage(content)
    const message = new MessageInfoModel({
      sendUser: this.talker,
      connectUser: this.talker,
      messageContent: result.data.info.text
    } as MessageInfo)
    this.messageList.push(message)
    AVPlayerClass.play('information')
    await StoreClass.addChatMessage(this.talker.user_id, message)
    this.scroller.scrollEdge(Edge.Bottom)
    this.talkerInputIng = false
    //   对方的名称
  }

  // 删除消息
  delMessage(messageId: string) {
    let index = this.messageList.findIndex(message => message.id === messageId)
    this.messageList.splice(index, 1)
  }

  aboutToAppear(): void {
    this.talker = router.getParams() as UserInfo
    // 数据的更新
    this.messageList = StoreClass.getChatMessage(this.talker.user_id)
    // 播放录音初始化
    AudioRender.init()
    // UI也更新完成才能滚动
    setTimeout(() => {
      this.scroller.scrollEdge(Edge.Bottom)
    }, 100)
  }

  build() {
    Column() {
      // 顶部
      Row() {
        Stack({ alignContent: Alignment.Start }) {
          Text(this.talkerInputIng ? '对方正在输入' : this.talker.username)
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontSize(16)
            .fontColor($r('app.color.text_primary'))
          Image($r('app.media.ic_public_arrow_left'))
            .width(30)
            .height(30)
            .onClick(() => {
              router.back()
            })
        }
        .height(50)
      }
      .padding({
        left: 10,
        right: 10
      })

      //聊天内容
      List({ space: 20, scroller: this.scroller }) {
        ForEach(this.messageList, (item: MessageInfoModel) => {
          ListItem() {
            Message({
              item,
              delMessage: (id) => {
                this.delMessage(id)
              },
              previewImage:()=>{
                this.previewUrl = 'file://'+item.sourceFilePath
                this.previewType = item.messageType
                this.previewController.open()
              }
            })
          }
        })
      }
      .layoutWeight(1)
      .width('100%')
      .backgroundColor($r('app.color.back_color'))
      .padding({
        top: 20,
        bottom: 60
      })

      BottomInput({
        talker: this.talker,
        sendTextMessage: (content) => {
          this.sendTextMessage(content)
        },
        sendVoiceMessage: (message) => {
          this.sendVoiceMessage(message)
        },
        sendImageMessage: (messageList) => {
          this.sendImageMessage(messageList)
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}