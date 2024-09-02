import { router } from '@kit.ArkUI';

@Entry
@Component
struct SharedAnimateCase01 {
  @State message: string = 'SharedAnimateCase01';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Image($r('app.media.b'))
          .width(200)
          .sharedTransition('imageShared')

        Button('跳转02')
          .onClick(()=>{
            router.pushUrl({
              url:'pages/12/SharedAnimateCase02'
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}