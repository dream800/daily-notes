// 手动引入第一步
import animator, { AnimatorOptions, AnimatorResult } from '@ohos.animator'

@Entry
@Component
struct AnimatorCase {
  @State
  rotateAngle: number = 0
  @State
  isPlay: boolean = false
  // 准备的动画参数
  animateOption: AnimatorOptions = {
    delay: 0,
    easing: "linear",
    fill: "backwards",
    direction: "normal",
    // 下面的参数是动画的核心
    iterations: -1,
    duration: 10 * 1000,
    begin: 0,
    end: 360
  }
  // 得到动画结果(动画遥控器)
  animateResult: AnimatorResult = animator.create(this.animateOption)

  aboutToAppear(): void {
    // 监听动画更新函数
    this.animateResult.onframe = (val) => {
      this.rotateAngle = val
    }
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Image($r('app.media.b'))
          .width(200)
          .borderRadius(100)
          .rotate({
            angle: this.rotateAngle
          })

        Button('播放/暂停')
          .onClick(() => {
            this.isPlay = !this.isPlay
            this.isPlay ? this.animateResult.play() : this.animateResult.pause()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}