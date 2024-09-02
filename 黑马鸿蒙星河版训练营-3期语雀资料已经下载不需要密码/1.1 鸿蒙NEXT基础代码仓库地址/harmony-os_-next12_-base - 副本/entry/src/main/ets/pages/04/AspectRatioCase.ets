@Entry
@Component
struct AspectRatioCase {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .width(200)
          // .height(200)
          // .aspectRatio(1)
          // .aspectRatio(9/16)
          .aspectRatio(4/3)
          .backgroundColor(Color.Pink)

      }
      .width('100%')
    }
    .height('100%')
  }
}