@Entry
@Component
struct BindCoverCase {
  @State
  showContent: boolean = false

  @Builder
  bindContent() {
    Column() {
      Text('我是模态框内容')
        .fontSize(50)
    }.width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }

  build() {
    Column() {
      Button('打开全屏模态')
        .onClick(() => {
          this.showContent = true
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .bindContentCover($$this.showContent, this.bindContent(), {
      modalTransition:ModalTransition.NONE
    })
  }
}