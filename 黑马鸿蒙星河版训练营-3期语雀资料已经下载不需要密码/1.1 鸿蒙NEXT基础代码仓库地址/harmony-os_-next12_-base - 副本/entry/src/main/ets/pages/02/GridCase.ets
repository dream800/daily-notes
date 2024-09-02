@Entry
@Component
struct GridCase {
  build() {
    Row() {
      Column() {
        Grid() {
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
          MyGrid()
        }
        .columnsTemplate('1fr 1fr 1fr')
        // .rowsTemplate('1fr 1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct MyGrid {
  build() {
    GridItem() {
      Column() {

      }
      .width('100%')
      .height(200)
      .backgroundColor(Color.Pink)
    }
  }
}