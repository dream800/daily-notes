@Entry
@Component
struct RenameCase1 {
  // @Provide('newName')
  @Provide
  message: string = 'Hello World';
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        RenameChild1()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct RenameChild1 {
  @Consume('message')
  // 重起的名字
  newName:string
  build() {
    Row() {
      Column() {
        Text(this.newName)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}