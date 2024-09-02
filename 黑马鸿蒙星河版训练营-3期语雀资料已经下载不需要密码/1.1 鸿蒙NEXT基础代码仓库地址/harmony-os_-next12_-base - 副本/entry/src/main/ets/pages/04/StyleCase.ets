@Entry
@Component
struct StyleCase {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .width(200)
          .backgroundColor(Color.Red)
          .fontWeight(FontWeight.Bold)//     用1.通用 +  2.组件专属的样式
            //   .textAlign(2)
            //    枚举的作用是让一个值变得有意义，可读性更强
          .textAlign(TextAlign.End)


      }
      .width('100%')
    }
    .height('100%')
  }
}