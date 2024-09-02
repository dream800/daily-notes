//消息类型
import { UserInfo } from './users'
import { util } from '@kit.ArkTS'

export enum MessageTypeEnum {
  TEXT, //文本消息
  AUDIO, //音频消息
  VIDEO, //视频消息
  IMAGE, //图片消息
  LOCATION, //定位消息
  LINK, //链接消息
}

//消息数据结构
export interface MessageInfo {
  id: string
  sendUser: UserInfo //消息的发送人
  connectUser: UserInfo //消息是跟谁发的（消息的归属者）
  messageContent: string //消息预览时的内容
  sendTime:number //发送时间戳
  messageType:MessageTypeEnum //消息类型
  sourceFilePath:string //资源文件的沙箱地址，存储地址
  sourceDuration:number //资源时长
}
export class MessageInfoModel implements MessageInfo {
  id: string = ''
  sendUser: UserInfo = {} as UserInfo
  connectUser: UserInfo = {} as UserInfo
  messageContent: string = ''
  sendTime: number = 0
  messageType: MessageTypeEnum = MessageTypeEnum.TEXT
  sourceFilePath: string = ''
  sourceDuration: number = 0

  constructor(model: MessageInfo) {
    this.id = model.id || util.generateRandomUUID() //生成随机的id
    this.sendUser = model.sendUser
    this.connectUser = model.connectUser
    this.messageContent = model.messageContent
    this.sendTime = model.sendTime || Date.now() //获取当前时间戳
    this.messageType = model.messageType || MessageTypeEnum.TEXT //如果没发消息类型，默认就是文本
    this.sourceFilePath = model.sourceFilePath
    this.sourceDuration = model.sourceDuration
  }
}
