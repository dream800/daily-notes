import { webview } from '@kit.ArkWeb'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct WebControlDemo {
  @State
  controller: webview.WebviewController = new webview.WebviewController()

  showMsg(){
      promptAction.showDialog({
        message:'666'
      })
  }

  build() {
    Row() {
      Column() {
        Button('变！')
          .onClick(() => {
            //     调用网页的方法
            this.controller.runJavaScript('changeText()', (err, result) => {
              if (err) {
                promptAction.showToast({
                  message: '调用失败'
                })
              }
              if (result) {
                promptAction.showToast({
                  message: result
                })
              }
            })
          })

        Button('注入方法')
          .onClick(()=>{
              this.controller.registerJavaScriptProxy({
                objKey:()=>{
                  this.showMsg()
                }
              },'objName',['objKey'])
          })
        Button('刷新')
          .onClick(()=>{
              this.controller.refresh()
          })
        Web({
          src: $rawfile('index.html'),
          controller: this.controller
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}