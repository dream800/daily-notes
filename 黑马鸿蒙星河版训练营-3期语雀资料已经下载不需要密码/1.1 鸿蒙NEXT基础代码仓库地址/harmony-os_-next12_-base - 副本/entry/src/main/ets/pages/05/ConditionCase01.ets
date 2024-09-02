@Entry
@Component
struct ConditionCase01 {
  @State isShow:boolean = false

  build() {
    Row() {
      Column() {
        Toggle({
          type:ToggleType.Switch,
          isOn:$$this.isShow
        })
        // 满足条件才去渲染if else
        // if(this.isShow){
        //   Image($r('app.media.b'))
        //     .width(100)
        // }else{
        //   Image($r('app.media.a'))
        //     .width(100)
        // }
        Image($r('app.media.b'))
          .width(100)
          // 展示
          // .visibility(Visibility.Visible)
          // Hidden虽然不展示，但是会占位置（不影响其他元素）
          // .visibility(this.isShow?Visibility.Visible:Visibility.Hidden)
          // None不展示，也不会占位置
          .visibility(this.isShow?Visibility.Visible:Visibility.None)
      }
      .width('100%')
    }
    .height('100%')
  }
}