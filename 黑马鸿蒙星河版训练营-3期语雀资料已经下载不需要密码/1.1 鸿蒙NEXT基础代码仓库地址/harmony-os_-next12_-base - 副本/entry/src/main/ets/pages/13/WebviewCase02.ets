import { webview } from '@kit.ArkWeb'

@Entry
@Component
struct WebviewCase02 {
  build() {
    Row() {
      Column() {
       Web({
         src:'file://'+getContext().filesDir+'/toutiao/index.html',
         controller:new webview.WebviewController()
       })
         .domStorageAccess(true)
      }
      .width('100%')
    }
    .height('100%')
  }
}