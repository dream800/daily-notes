@Entry
@Component
struct StackCase {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        // 容器组件
        // 堆叠组件
        Stack() {
          // 第一个
          Row() {

          }
          .width(300)
          .height(300)
          .backgroundColor(Color.Blue)

          // 第二个
          Row() {

          }
          .width(200)
          .height(200)
          .backgroundColor(Color.Green)
          // 第三个
          Row() {

          }
          .width(100)
          .height(100)
          .backgroundColor(Color.Red)
        }
        .width(400)
        .height(400)
        .backgroundColor(Color.Pink)
      }
      .width('100%')
    }
    .height('100%')
  }
}