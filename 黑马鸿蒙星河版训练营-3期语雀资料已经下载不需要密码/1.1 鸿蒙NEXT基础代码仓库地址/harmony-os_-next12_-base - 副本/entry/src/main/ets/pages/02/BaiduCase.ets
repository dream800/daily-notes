@Entry
@Component
struct BaiduCase {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column({ space: 20 }) {
        // 1.图片：默认展示原有的尺寸,默认保持原有的比例
        // Row() {
        Stack() {
          Image("https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png")
            .width(180)
          Text('鸿蒙版')
            .fontSize(12)
            .fontColor('#ccc')
            .translate({
              x:45
            })
        }
        .width('100%')

        // .justifyContent(FlexAlign.Center)

        //   2.输入框 + 按钮
        Row() {
          // 自适应效果
          TextInput()
            .layoutWeight(1)
            .border({
              width: 2,
              color: '#ff928c8c'
            })
            .borderRadius({
              topLeft: 4,
              bottomLeft: 4
            })
            .backgroundColor(Color.Pink)
            .height(40)
          Button("百度一下")
            .type(ButtonType.Normal)
            .borderRadius({
              topRight: 4,
              bottomRight: 4
            })
            .translate({
              x: -2
            })
        }
        .padding(16)
        .width('100%')
      }
      .width('100%')
    }
    .height('100%')
  }
}