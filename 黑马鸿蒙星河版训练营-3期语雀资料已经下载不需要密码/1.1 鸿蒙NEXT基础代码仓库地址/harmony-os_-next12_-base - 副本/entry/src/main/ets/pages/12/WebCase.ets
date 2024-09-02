import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct WebCase {
  controller: WebviewController = new webview.WebviewController()

  build() {
    Row() {
      Column() {
        Button('滚下去')
          .onClick(()=>{
            this.controller.pageDown(true)
          })
        Web({
          src: 'http://bilibili.com',
          controller: this.controller
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}