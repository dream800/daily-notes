@Builder
export function MyLayoutBuilder(leftText:string,rightText:string='123') {
  Row() {
    Text(leftText)
    Text(rightText)
  }
  .width('100%')
  .padding(20)
  .justifyContent(FlexAlign.SpaceBetween)
  .backgroundColor(Color.Pink)
  .borderRadius(8)
}

export interface StateText {
  leftText:string
  rightText:string
}