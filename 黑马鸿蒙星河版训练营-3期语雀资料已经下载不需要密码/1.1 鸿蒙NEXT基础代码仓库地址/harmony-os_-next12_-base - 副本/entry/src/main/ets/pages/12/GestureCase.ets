import { display, promptAction } from '@kit.ArkUI'

@Entry
@Component
struct GestureCase {
  @State
  showBind: boolean = false
  @State
  screenWidth: number = 0
  @State
  selectType: SelectType = SelectType.NONE

  // aboutToAppear(): void {
  //   //获取当前屏幕的宽度
  //   this.screenWidth = px2vp(display.getDefaultDisplaySync().width)
  // }

  @Builder
  bindContent() {
    Column() {
      Row() {
        Text('删')
          .fontColor('#fff')
          .fontSize(24)
          .width(100)
          .aspectRatio(1)
          .backgroundColor(this.selectType === SelectType.DELETE ? Color.Red : '#ff757070')
          .borderRadius(50)
          .rotate({
            angle: -10
          })
          .textAlign(TextAlign.Center)

        Text('文')
          .fontColor('#fff')
          .fontSize(24)
          .width(100)
          .aspectRatio(1)
          .backgroundColor(this.selectType === SelectType.TEXT ? Color.Red : '#ff757070')
          .borderRadius(50)
          .rotate({
            angle: 10
          })
          .textAlign(TextAlign.Center)

      }.width('100%')
      .padding({
        left: 20,
        right: 20
      })
      .justifyContent(FlexAlign.SpaceBetween)
    }.width('100%')
    .height('100%')
    .backgroundColor('#4f000000')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Button('发语音消息')
        .width('100%')
        .type(ButtonType.Normal)
        .backgroundColor('#ff149d21')
        .gesture(
          GestureGroup(GestureMode.Parallel,
            // 1.先长摁
            LongPressGesture()
              .onAction(() => {
                //   触发手势时执行的内容
                this.showBind = true
              })
              .onActionEnd(() => {
                this.showBind = false
              }),
            // 2.滑动
            PanGesture()
              .onActionUpdate((event) => {
                // promptAction.showToast({
                //   message:'我开始滑了:'+event.fingerList[0].globalX+'/'+this.screenWidth
                // })
                if (event.fingerList[0].globalX < this.screenWidth / 2) {
                  this.selectType = SelectType.DELETE
                } else {
                  this.selectType = SelectType.TEXT
                }
              })
              .onActionEnd(() => {
                this.selectType = SelectType.NONE
              }),
            //   3.按压
            TapGesture()
              .onAction(() => {
                promptAction.showToast({
                  message:'别按我了！'
                })
              })

          )
        )
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.End)
    .bindContentCover($$this.showBind, this.bindContent(), {
      modalTransition: ModalTransition.NONE
    })
    .onAreaChange((_, _newValue) => {
      this.screenWidth = _newValue.width as number
    })
  }
}

enum SelectType {
  NONE,
  DELETE,
  TEXT
}