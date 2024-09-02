@Entry
@Component
struct ScrollCase {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Row() {

        }
        .width('100%')
        .height(60)
        .backgroundColor('#ff4400')

        Scroll() {
          // 1.如果里面没有外面大，那就不会出现滚动
          // 2.scroll里面只能有一个容器！
          // 经验：给scroll设置大小，当里面的内容超出外面的大小时就会出现滚动条
            //   实现滚动
          Column({space:20}){
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
          }
        }
        .layoutWeight(1)


        Row() {

        }
        .width('100%')
        .height(60)
        .backgroundColor('#ff3165b3')
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ScrollItem {
  build() {
    Row() {
      Text('滚动的每一项')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height(100)
    .backgroundColor(Color.Pink)
  }
}