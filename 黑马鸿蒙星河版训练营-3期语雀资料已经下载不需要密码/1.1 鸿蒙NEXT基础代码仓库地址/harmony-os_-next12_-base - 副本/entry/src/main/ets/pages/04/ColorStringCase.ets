@Entry
@Component
struct ColorStringCase {
  build() {
    Row() {
      Column() {
        Text($r('app.string.my_first_string'))
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.my_first_color'))
      }
      .width('100%')
    }
    .height('100%')
  }
}