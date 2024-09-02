@Entry
@Component
struct Index1 {
  build() {
    //   1.自定义
    //   2.系统内置(优先学习)
    //   页面布局(组件拆分)
    //   原则:从上倒下 从左到右 从外往里 从大到小
    //   头顶天 脚踩地
    //   线性布局:从上倒下 从左到右
    //   从上倒下:布局  Column 垂直排列,水平剧中,内容超出时没有滚动条
    // Column(){
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('0')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('0')
    // }
    // .width('100%')
    // .height(200)
    // 给容器设置大小:
    // 宽度width/高度height
    // 可以是百分比(字符串),还可以是固定的数据(vp)
    //   从左往右:布局 Row 水平排列 垂直剧中,内容超出时没有滚动条
    // Row(){
    //     Text('1')
    //     Text('1')
    //     Text('1')
    //     Text('1')
    //     Text('1')
    //     Text('1')
    //     Text('0')
    //     Text('1')
    //     Text('1')
    //     Text('1')
    //     Text('1')
    //     Text('1')
    //     Text('1')
    //     Text('0')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('0')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('0')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('0')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('0')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('0')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('0')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('1')
    //   Text('0')
    // }
    // .width('100%')
    // .height(400)

    //   方式一:Row
    // Column(){
    //   Row({space:10}){
    //     Column(){
    //
    //     }
    //     .width(80)
    //     .height(200)
    //     .backgroundColor('blue')
    //     Row(){
    //
    //     }
    //     .width(80)
    //     .height(200)
    //     .backgroundColor('#ff4400')
    //     Column(){
    //
    //     }
    //     .width(80)
    //     .height(200)
    //     .backgroundColor('rgb(123,123,223)')
    //     // Row(){
    //     //
    //     // }
    //     // .width(80)
    //     // .height(200)
    //     // .backgroundColor('rgba(223,231,110,1)')
    //     // Row(){
    //     //
    //     // }
    //     // .width(80)
    //     // .height(200)
    //     // .backgroundColor(Color.Pink)
    //   }.height('100%')
    // }
    // .width('100%')
    // 方式二:
    // 需要实现垂直方向的剧中
    // 主轴:Column是纵向排列的,排列的方向就是主轴方向
    // Column(){
    //     Row({space:10}){
    //       Column(){
    //
    //       }
    //       .width(80)
    //       .height(200)
    //       .backgroundColor('blue')
    //       Row(){
    //
    //       }
    //       .width(80)
    //       .height(200)
    //       .backgroundColor('#ff4400')
    //       Column(){
    //
    //       }
    //       .width(80)
    //       .height(200)
    //       .backgroundColor('rgb(123,123,223)')
    //       // Row(){
    //       //
    //       // }
    //       // .width(80)
    //       // .height(200)
    //       // .backgroundColor('rgba(223,231,110,1)')
    //       // Row(){
    //       //
    //       // }
    //       // .width(80)
    //       // .height(200)
    //       // .backgroundColor(Color.Pink)
    //     }
    // }
    // .width('100%')
    // .height('100%')
    // // justifyContent设置主轴方向的对其方式
    // // .justifyContent(FlexAlign.Center)
    // .justifyContent(FlexAlign.End)
    // 需要实现水平方向的剧中
    Row() {
      Row({ space: 10 }) {
        Column() {

        }
        .width(80)
        .height(200)
        .backgroundColor('blue')

        Row() {

        }
        .width(80)
        .height(200)
        .backgroundColor('#ff4400')

        Column() {

        }
        .width(80)
        .height(200)
        .backgroundColor('rgb(123,123,223)')

        // Row(){
        //
        // }
        // .width(80)
        // .height(200)
        // .backgroundColor('rgba(223,231,110,1)')
        // Row(){
        //
        // }
        // .width(80)
        // .height(200)
        // .backgroundColor(Color.Pink)
      }
    }.width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}