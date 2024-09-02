import { router } from '@kit.ArkUI'
import('@ohos/test/src/main/ets/pages/Index')
@Entry
@Component
struct RouterBundleCase {
  build() {
    Row() {
      Column({space:20}) {
         Button('路径跳转HSP包页面')
           .onClick(()=>{
             router.pushUrl({
               // @bundle:包名/模块名/页面路径/ets
               url:'@bundle:com.example.harmonyos_next12_base/library/ets/pages/Index'
             })
           })

         Button('name跳转HSP包页面')
           .onClick(()=>{
             router.pushNamedRoute({
               name:'hps-test'
             })
           })
      }
      .width('100%')
    }
    .height('100%')
  }
}