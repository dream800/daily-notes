// 1.不能导入导出
// 2.只能针对某个组件进行拓展
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct ExtendCase {
  build() {
    Row() {
      Column({ space: 10 }) {
        Button('微信支付')
          .MyButtonExtend('wechat')
        Button('支付宝支付')
          .MyButtonExtend('alipay')
        Button('银行卡支付')
          .MyButtonExtend('bank')
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Button)
function MyButtonExtend(type: 'wechat' | 'alipay' | 'bank') {
  .width('80%')
  // 三元表达式    条件？成立：不成立
  .backgroundColor(type === 'wechat' ? Color.Green : (type === 'alipay' ? Color.Blue : Color.Pink))
  .type(ButtonType.Normal)
  .onClick(() => {
    promptAction.showToast({
      message: type === 'wechat' ? '微信支付成功' : '支付宝支付成功'
    })
  })
}