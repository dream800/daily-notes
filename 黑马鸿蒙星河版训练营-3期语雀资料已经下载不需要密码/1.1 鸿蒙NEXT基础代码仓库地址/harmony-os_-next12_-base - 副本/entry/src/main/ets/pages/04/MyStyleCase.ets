import { promptAction } from '@kit.ArkUI'
@Styles
function MyButtonStyle(){
  .width('80%')
  .backgroundColor('#ff0a6adb')
  .onClick(()=>{
    promptAction.showToast({
      message:'支付宝支付成功'
    })
  })
}

@Entry
@Component
struct MyStyleCase {
  // 组件内生命@Styles,只能在当前组件用
  // 1.不能导入导出
  // 2.不能传参
  // 3.只能用通用属性和事件
  @Styles
  MyStyleFunction(){
    .width('80%')
    .backgroundColor('#FF00FF0F')
    .onClick(()=>{
      promptAction.showToast({
        message:'微信支付成功'
      })
    })
  }
  build() {
    Row() {
      Column({ space: 20 }) {
        Button('微信支付')
          .MyStyleFunction()
        Button('微信支付')
          .MyStyleFunction()

        Button('微信支付')
          .MyStyleFunction()

        Button('微信支付')
          .MyStyleFunction()

        Button('支付宝支付')
          .MyButtonStyle()
      }
      .width('100%')
    }
    .height('100%')
  }
}