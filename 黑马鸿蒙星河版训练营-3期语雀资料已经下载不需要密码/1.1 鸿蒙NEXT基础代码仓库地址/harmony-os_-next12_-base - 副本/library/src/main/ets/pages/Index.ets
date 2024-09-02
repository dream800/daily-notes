// 1.路由模块命名
// 2.导出当前模块
@Entry({ routeName:'hps-test' })
@Component
export struct Index {
  @State message: string = 'HSP-index';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}