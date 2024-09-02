@Entry
@Component
struct VideoControlCase {
  // 视频封面 previewUri
  // 播放速度 currentProgressRate  0.75~2   0.25
  @State
  speed: number = 1
  @State
  isMuted: boolean = false
  @State
  time: number = 0
  @State
  duration: number = 0
  @State
  isFullScreen: boolean = false
  controller: VideoController = new VideoController()

  build() {
    Row() {
      Column({ space: 20 }) {
        Stack({ alignContent: Alignment.BottomEnd }) {
          Video({
            src: $rawfile('1.mp4'),
            previewUri: $r('app.media.b'),
            currentProgressRate: this.speed,
            controller: this.controller
          })
            .height(500)
            .objectFit(ImageFit.Contain)
            .controls(this.isFullScreen)//不展示控制条
            .autoPlay(false)//视频是否自动播放
            .loop(true)//视频是否循环播放
            .muted(this.isMuted)//视频是否静音
            .onPrepared((duration) => {
              this.duration = duration.duration
            })
            .onUpdate((time) => {
              this.time = time.time
            })
            .onFullscreenChange((screen) => {
              this.isFullScreen = screen.fullscreen
            })
          Button('全屏')
            .onClick(() => {
              this.controller.requestFullscreen(true)
              this.isFullScreen = true
            })
        }

        Row() {
          Text('播放进度：')
          Slider({
            value:$$this.time,
            min: 0,
            max: this.duration,
            style: SliderStyle.InSet
          })
            .layoutWeight(1)
            .onChange((val)=>{
                // 手动设置视频播放进度
                this.controller.setCurrentTime(val)
            })
        }

        Row() {
          Text('播放速度：')
          Slider({
            value: $$this.speed,
            min: 0.75,
            max: 2,
            step: 0.25,
            style: SliderStyle.InSet
          })
            .layoutWeight(1)
        }

        Row({ space: 20 }) {
          Button('播放')
            .onClick(() => {
              this.controller.start()
            })
          Button('暂停')
            .onClick(() => {
              this.controller.pause()
            })
          Button('停止')
            .onClick(() => {
              this.controller.stop()
            })
          Button('静音')
            .onClick(() => {
              this.isMuted = !this.isMuted
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}