import { MessageInfoModel } from '../models/message'
import { StoreClass } from '../utils/StoreClass'
import { emitter } from '@kit.BasicServicesKit'
import { router } from '@kit.ArkUI'
import { FileOperate } from '../utils/FileOperate'
import { PopupItem } from '../models/popup'
import { scanBarcode, scanCore } from '@kit.ScanKit'

@Component
struct WeChat {
  @State
  list: MessageInfoModel[] = []
  @State
  showDropDown: boolean = false
  @State
  popList: PopupItem[] = [
    {
      title: '发起群聊',
      icon: $r('app.media.ic_public_message')
    },
    {
      title: '添加朋友',
      icon: $r('app.media.ic_public_add_friend')
    },
    {
      title: '扫一扫',
      icon: $r('app.media.ic_public_scan'),
      itemClick: () => {
        this.scan()
        this.showDropDown = false

      }
    },
    {
      title: '收付款',
      icon: $r('app.media.ic_public_receive'),
      itemClick:()=>{
        router.pushUrl({
          url:'pages/PayQrCode'
        })
      }
    }
  ]

  @Builder
  getDropDown() {
    Column() {
      ForEach(this.popList, (item: PopupItem) => {
        Row({ space: 5 }) {
          Image(item.icon)
            .fillColor($r('app.color.white'))
            .width(20)
            .height(20)
          Text(item.title)
            .fontColor(Color.White)
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
        }
        .width('100%')
        .height(48)
        .justifyContent(FlexAlign.Center)
        .padding({
          left: 10,
          right: 10
        })
        .onClick(() => {
          item.itemClick && item.itemClick()
        })

      })
    }
    .width(120)
  }

  @Builder
  getListEnd(userId: string) {
    Row() {
      Text('删除')
        .width(80)
        .textAlign(TextAlign.Center)
        .fontColor($r('app.color.white'))
    }.height(70)
    .padding({
      left: 20,
      right: 20
    })
    .backgroundColor($r('app.color.danger'))
    .onClick(() => {
      // 删除首选项
      StoreClass.removeChatAllMessage(userId)
      // 当前这个人的沙箱中的文件
      FileOperate.delUserPath(userId)
    })
  }

  aboutToAppear(): void {
    this.list = StoreClass.getAllChatLastMessage()
    emitter.on(StoreClass.wechat_key, () => {
      this.list = StoreClass.getAllChatLastMessage()
    })
  }

  transTime(time: number) {
    const dateobj = new Date(time)
    const year = dateobj.getFullYear()
    // const month = dateobj.getMonth()+1 //如果是展示，记得+1
    const month = dateobj.getMonth()
    const date = dateobj.getDate()
    const hours = dateobj.getHours()
    const minutes = dateobj.getMinutes()
    if (year === new Date().getFullYear()) {
      //今年
      if (month === new Date().getMonth()) {
        //这个月
        if (date === new Date().getDate()) {
          //当天
          return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`
        } else {
          return `${new Date().getDate() - date}天前`
        }
      } else {
        return `${month}月${date}日`
      }
    } else {
      return `${year}年${month}月${date}日`
    }
  }

  // 扫码
  async scan() {
    try {
      // result可以进行后续业务的处理
      let result = await scanBarcode.startScanForResult(getContext(), {
        scanTypes: [scanCore.ScanType.ALL],
        enableMultiMode: true,
        enableAlbum: true
      })
      AlertDialog.show({
        message: JSON.stringify(result)
      })
    } catch (e) {
      AlertDialog.show({
        message: '暂不支持扫码功能'
      })
    }
  }

  build() {

    Column() {
      Row() {
        Text(`微信(${this.list.length})`)
          .fontSize(16)
          .fontColor($r('app.color.text_primary'))
        Image($r('app.media.ic_public_add_norm'))
          .width(20)
          .height(20)
          .fillColor($r('app.color.text_primary'))
          .position({
            x: '100%'
          })
          .translate({
            x: -40,
            y: 15
          })
          .bindPopup(this.showDropDown, {
            builder: this.getDropDown,
            placement: Placement.Bottom,
            onStateChange: (event) => {
              this.showDropDown = event.isVisible
            },
            popupColor: $r("app.color.popup_back"),
            backgroundBlurStyle: BlurStyle.NONE
          })
          .onClick(() => {
            this.showDropDown = true
          })

      }.width('100%')
      .justifyContent(FlexAlign.Center)
      .height(50)

      List() {
        ForEach(this.list, (item: MessageInfoModel) => {
          ListItem() {
            Row({ space: 10 }) {
              Image(item.connectUser.avatar)
                .width(50)
                .height(50)
                .borderRadius(4)

              Column({ space: 10 }) {
                Row() {
                  Text(item.connectUser.username)
                    .fontColor($r('app.color.text_primary'))
                    .fontSize(16)
                  Text(this.transTime(item.sendTime))
                    .fontSize(12)
                    .fontColor($r('app.color.text_second'))
                    .margin({
                      top: 10
                    })
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')

                Text(item.messageContent)
                  .fontColor($r('app.color.text_second'))
                  .fontSize(14)
                  .maxLines(1)
                  .textOverflow({
                    overflow: TextOverflow.Ellipsis
                  })
              }
              .justifyContent(FlexAlign.SpaceBetween)
              .alignItems(HorizontalAlign.Start)
              .height(50)
              .layoutWeight(1)
              .padding({
                top: 3,
                bottom: 3
              })
            }
            .stateStyles({
              normal: {
                .backgroundColor($r('app.color.white'))
              },
              pressed: {
                .backgroundColor($r('app.color.back_color'))
              }
            })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/ChatDetail/ChatDetail',
                params: item.connectUser
              })
            })
          }
          .padding({
            top: 10,
            bottom: 10
          })
          .swipeAction({
            end: () => {
              this.getListEnd(item.connectUser.user_id)
            }
          })
        })
      }
      .divider({
        strokeWidth: 1,
        color: $r('app.color.border_color')
      })
      .padding({
        left: 10,
        right: 20
      })
    }

    .height('100%')

  }
}

export default WeChat