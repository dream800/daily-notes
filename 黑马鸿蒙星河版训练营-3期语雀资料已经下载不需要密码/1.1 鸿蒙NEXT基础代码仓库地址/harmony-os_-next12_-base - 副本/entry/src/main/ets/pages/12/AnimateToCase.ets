@Entry
@Component
struct AnimateToCase {
  @State message: string = 'Hello World';
  @State textSize: number = 50
  @State textColor: string = '#000'
  @State textOpacity: number = 1
  @State positionX: number = 0
  @State positionY: number = 0

  build() {
    Column({ space: 20 }) {
      Text(this.message)
        .fontSize(this.textSize)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.textColor)
        .opacity(this.textOpacity)
        .position({
          x: this.positionX,
          y: this.positionY,
        })
      Button('隐藏')
        .onClick(() => {
          animateTo({
            // 动画参数的配置
            duration: 2000
          }, () => {
            // 动画的结果
            this.message = 'World Hello'
            this.textSize = 16
            this.textColor = '#ff00f0'
            this.textOpacity = 0
            this.positionX = 999
            this.positionY = 999
          })
        })
      Button('显示')
        .onClick(() => {
          animateTo({
            // 动画参数的配置
            duration: 5000
          }, () => {
            // 动画的结果
            this.message = 'Hello World'
            this.textSize = 50
            this.textColor = '#000'
            this.textOpacity = 1
            this.positionX = 0
            this.positionY = 0
          })
        })
    }
    .width('100%')
    .height('100%')
  }
}