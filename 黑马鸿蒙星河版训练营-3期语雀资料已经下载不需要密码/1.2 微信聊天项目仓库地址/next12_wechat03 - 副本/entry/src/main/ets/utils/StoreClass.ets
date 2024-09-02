import { preferences } from '@kit.ArkData'
import { MessageInfoModel } from '../models/message'
import { DefaultUserList } from '../models/users'
import { emitter } from '@kit.BasicServicesKit'

export class StoreClass {
  static context: Context
  static wechat_key: string = 'WECHAT_CHAT'

  // 初始化
  static init(context: Context) {
    StoreClass.context = context
  }

  //   获取某个人的仓库
  static getUserStore(userId: string) {
    return preferences.getPreferencesSync(StoreClass.context, { name: `${StoreClass.wechat_key}_${userId}` })
  }

  //   添加某个人的一条记录
  static async addChatMessage(userId: string, message: MessageInfoModel) {
    const store = StoreClass.getUserStore(userId)
    store.putSync(message.id, JSON.stringify(message))
    await store.flush()
    //   线程通信：发布者
    emitter.emit(StoreClass.wechat_key)
  }

  //   获取某个人的所有记录
  static getChatMessage(userId: string) {
    const store = StoreClass.getUserStore(userId)
    const all = store.getAllSync()
    if (all) {
      const list = Object.values(all).map((item: string) => {
        return JSON.parse(item) as MessageInfoModel
      })
      list.sort((a, b) => {
        return a.sendTime - b.sendTime
      })
      return list
    }
    return []
  }

  //   删除某个人的一条记录
  static async removeChatMessage(userId: string, messageId: string) {
    const store = StoreClass.getUserStore(userId)
    store.deleteSync(messageId)
    await store.flush()
    //   线程通信：发布者
    emitter.emit(StoreClass.wechat_key)
  }

  //   删除某个人的所有记录
  static removeChatAllMessage(userId: string) {
    preferences.deletePreferences(StoreClass.context, { name: `${StoreClass.wechat_key}_${userId}` })
    //   线程通信：发布者
    emitter.emit(StoreClass.wechat_key)
  }

  //   获取所有人的最后一条记录
  static getAllChatLastMessage() {
    const lastList: MessageInfoModel[] = []
    DefaultUserList.forEach(user => {
      const chatList = StoreClass.getChatMessage(user.user_id)
      if (chatList.length) {
        lastList.push(chatList[chatList.length-1])
      }
    })
    lastList.sort((a, b) => {
      return b.sendTime - a.sendTime
    })
    return lastList
  }
}