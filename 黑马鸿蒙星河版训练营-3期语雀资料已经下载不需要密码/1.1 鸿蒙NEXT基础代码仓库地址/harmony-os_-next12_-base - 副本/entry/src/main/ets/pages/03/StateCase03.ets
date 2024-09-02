@Entry
@Component
struct StateCase03 {
  noStateMessage:string = 'Hello World'
  @State
  message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(JSON.stringify(this))
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}