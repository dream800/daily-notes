@Component
struct BuildParamComp {
  @State
  leftText: string = '默认内容'

  @State
  bgc:string = '#ccc'
  // 如果子组件有且只有一个builderParam，而且没传值  就可以用尾随闭包
  @BuilderParam
  rightContent: () => void

  build() {
    Row() {
      Text(this.leftText)
      if (this.rightContent) {
        this.rightContent()
      }
    }
    .width('100%')
    .padding(20)
    .backgroundColor(this.bgc)
    .borderRadius(6)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

export { BuildParamComp }