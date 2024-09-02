@Entry
@Component
struct BuilderCase03 {
  // builder传递参数实现响应式条件：1.@State
  @State
  dateTime:string = '05-13'
  @Builder
  MyLayoutBuilder(dateInfo:DateInfo) {
    Row() {
      Text(dateInfo.leftText)
      Text(dateInfo.rightText)
    }
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.Pink)
    .borderRadius(8)
  }
  build() {
    Row() {
      Column({space:20}) {
        Text(this.dateTime)
        // builder传递参数实现响应式条件：2必须要用对象字面量
        this.MyLayoutBuilder({ leftText:'异常时间',rightText:this.dateTime })

        Button('修改时间')
          .onClick(()=>{
              this.dateTime = '05-14'
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
interface DateInfo {
  leftText:string
  rightText:string
}