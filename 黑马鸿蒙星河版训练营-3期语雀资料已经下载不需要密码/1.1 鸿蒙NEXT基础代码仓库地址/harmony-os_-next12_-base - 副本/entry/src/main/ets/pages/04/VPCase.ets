@Entry
@Component
struct VPCase {
  // 1.px 像素
  // 2.vp 虚拟像素
  // 3.fp
  // 4.lpx

  build() {
    Row() {
      Column() {
          // 默认不带单位就是VP
          Row(){
            // 1vp 约等于 3px,px适合绝对大小，不论什么屏幕，固定物体的大小
            Text('100px')
          }.width(px2vp(100)).height('100px').backgroundColor(Color.Red)
          Row(){
            // 1vp 约等于 3px,px适合绝对大小，不论什么屏幕，希望看到的大小是差不多的
            Text('100')
          }.width(100).height(100).backgroundColor(Color.Red)
          Row(){
            Text('100vp')
          }.width('100vp').height('100vp').backgroundColor(Color.Red)
        // 华为理念：屏幕越大看到的应该越多
        Row(){
          Text('100fp')
            .fontSize('10fp')
        }.width('100fp').height('100fp').backgroundColor(Color.Red)
        Row(){
          Text('375lpx')
        }.width('375lpx').height('100lpx').backgroundColor(Color.Red)
        // lpx:屏幕越大 我就越大
        Text()
          .width('72lpx')
          .height('25lpx')
          .backgroundColor(Color.Brown)
      }
      .width('100%')
    }
    .height('100%')
  }
}