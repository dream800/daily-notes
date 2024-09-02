import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct ClickCase {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Row({ space: 10 }) {
          Row() {
            Text('1号盒子')
          }
          .width(100)
          .height(100)
          .backgroundColor(Color.Pink)
          .onClick(()=>{
            promptAction.showToast({
              message:'你猜对了'
            })
          })

          Row() {
            Text('2号盒子')
          }
          .width(100)
          .height(100)
          .backgroundColor(Color.Pink)
          .onClick(()=>{
            promptAction.showToast({
              message:'你猜错了'
            })
          })

          Row() {
            Text('3号盒子')
          }
          .width(100)
          .height(100)
          .backgroundColor(Color.Pink)
          .onClick(()=>{
            promptAction.showToast({
              message:'你猜错了'
            })
          })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}