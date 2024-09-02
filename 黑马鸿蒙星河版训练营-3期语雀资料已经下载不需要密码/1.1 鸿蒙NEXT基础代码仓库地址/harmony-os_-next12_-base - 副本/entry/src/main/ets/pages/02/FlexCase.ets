@Entry
@Component
struct FlexCase {
  build() {
    Row() {
      Column() {
        // Row和Column超出不会自动换行，也不出滚动条
        // Flex会将空间压缩从而分配给每个元素
        // 小括号里的是参数(flex是通过参数，可以换行)
        // 大括号后面的是属性方法(row Column实现都是借助属性方法)
        Flex({
          justifyContent:FlexAlign.SpaceEvenly,
          wrap:FlexWrap.Wrap
        }) {
          Row() {
          }
          .width(80)
          .height(120)
          .backgroundColor(Color.Blue)

          Row() {
          }
          .width(110)
          .height(120)
          .backgroundColor(Color.Gray)

          Row() {
          }
          .width(80)
          .height(120)
          .backgroundColor(Color.Green)

          Row() {
          }
          .width(80)
          .height(120)
          .backgroundColor(Color.Blue)

          Row() {
          }
          .width(110)
          .height(120)
          .backgroundColor(Color.Gray)


        }
        .width('100%')
        // 将剩余空间进行均分
        //  在两端中间进行均分
        // .justifyContent(FlexAlign.SpaceBetween)
        // 在每个元素两端中间进行均分
        // .justifyContent(FlexAlign.SpaceAround)
        //  将剩余空间均分到每个元素的两端
        // .justifyContent(FlexAlign.SpaceEvenly)
      }
      .padding(24)
      .width('100%')
    }
    .height('100%')
  }
}