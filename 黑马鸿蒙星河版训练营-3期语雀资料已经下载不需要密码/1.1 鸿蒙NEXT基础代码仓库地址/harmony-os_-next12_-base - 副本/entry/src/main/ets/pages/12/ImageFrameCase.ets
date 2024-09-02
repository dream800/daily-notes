@Entry
@Component
struct ImageFrameCase {
  @State
  playState: AnimationStatus = AnimationStatus.Initial

  build() {
    Row() {
      Column({ space: 20 }) {
        ImageAnimator()// .images([
          //   { src:'/assets/JDRunMan/app_refresh_people_0.png' },
          //   { src:'/assets/JDRunMan/app_refresh_people_1.png' },
          //   { src:'/assets/JDRunMan/app_refresh_people_2.png' },
          //   { src:'/assets/JDRunMan/app_refresh_people_3.png' }
          // ])
          // 每一帧图片的数组
          .images(Array.from(Array(37), (item: string, index: number) => {
            return { src: `/assets/JDLoading/loading_${index + 1}.png` } as ImageFrameInfo
          }))
          .width(340)
          .height(340)
          .duration(3000)
          .iterations(-1)
          .fillMode(FillMode.None)// 控制图片播放
          .state(this.playState)

        Button('播放')
          .onClick(() => {
            this.playState = AnimationStatus.Running
          })

        Button('暂停')
          .onClick(() => {
            this.playState = AnimationStatus.Paused
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}