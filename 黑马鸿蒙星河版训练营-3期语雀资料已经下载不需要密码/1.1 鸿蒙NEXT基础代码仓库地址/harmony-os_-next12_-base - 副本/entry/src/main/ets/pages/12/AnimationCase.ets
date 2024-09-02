@Entry
@Component
struct AnimationCase {
  @State message: string = 'Hello World';
  @State textSize:number = 50
  @State bgColor:string = '#ff00f0'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(this.textSize)
          .fontWeight(FontWeight.Bold)
          .backgroundColor(this.bgColor)
          .animation({
            // 动画执行时间
            duration:2000,
            // 动画重复的次数
            iterations:-1,
            // 动画运动曲线
            curve:Curve.Linear,
            // 动画延迟执行时间
            delay:5*1000,
            //播放模式
            playMode:PlayMode.Alternate
          })
        Button('变小')
          .onClick(()=>{
            this.textSize = 12
            this.bgColor = '#ff00f0f0'
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}