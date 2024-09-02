import { MyLayoutBuilder, StateText } from './builders/LayoutBuilder'

@Entry
@Component
struct BuilderCase02 {
  // 组件内builder创建的地方
  @State
  myInfo:StateText = {
    leftText:'异常时间',
    rightText:'05-13'
  }
  build() {
    Row() {
      Column({space:20}) {
          // 放置封装好的builder函数
        // MyLayoutBuilder({
        //   leftText:'异常时间',
        //   rightText:'05-13'
        // })
        // MyLayoutBuilder({
        //   leftText:'异常地点',
        //   rightText:'北京'
        // })
        // MyLayoutBuilder({
        //   leftText:'异常原因',
        //   rightText:'未知'
        // })
        // MyLayoutBuilder({
        //   leftText:'异常原因',
        //   rightText:'null'
        // })
        // MyLayoutBuilder('异常时间','05-13')

      }
      .width('100%')
      .padding(20)
    }
    .height('100%')
  }
}

// 全局builder创建的地方