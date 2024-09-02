@Entry
@Component
struct ScrollCase02 {
  // 数据区域(滚动控制器)
  scroller: Scroller = new Scroller()

  // 构建(绘制页面内容的函数)
  build() {
    Row() {
      Column() {
        Scroll(this.scroller) {
          Row({ space: 20 }) {
            ScrollItem2()
            ScrollItem2()
            ScrollItem2()
            ScrollItem2()
            ScrollItem2()
            ScrollItem2()
          }
          .backgroundColor(Color.Blue)
        }
        // 如果滚动方向不是默认的(纵向)就要手动设置才可以
        .scrollable(ScrollDirection.Horizontal)
        .width('100%')

        Button('滚后面去')
          .onClick(() => {
            this.scroller.scrollEdge(Edge.End)
          })
        Button('滚回来')
          .onClick(() => {
            this.scroller.scrollEdge(Edge.Start)
          })
        // 场景：回到顶部
        // 1.创建控制器
        // 2.控制器传递（传给哪个滚动组件就控制哪个组件）
        // 3.恰当的时机进行滚动的操作
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ScrollItem2 {
  build() {
    Column() {
      Text('一部好戏')
    }
    .width(100)
    .height(200)
    .backgroundColor(Color.Pink)
  }
}