@Entry
@Component
struct BuildParamCase {
  // 声明的一个要传递的内容！
  @Builder
  LeftBuilder() {
    Image($r('sys.media.ohos_ic_compnent_titlebar_back'))
      .width(20)
  }
  @Builder
  CenterBuilder(){
   Row(){
     Text('最新推荐')

     Text('🔥')
   }
   .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }
  @Builder
  RightBuilder(){
    Image($r('sys.media.ohos_ic_public_scan'))
      .width(20)
  }

  build() {
    Row() {
      Column() {
        //   Header容器
        MyBuilderParamChild()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct MyBuilderParamChild {
  @Builder
  defaultLeftParam(){
    Text('返回')
  }
  @BuilderParam
  leftContent:()=>void = this.defaultLeftParam


  @Builder
  defaultCenterParam(){
    Text('首页')
      .layoutWeight(1)
      .textAlign(TextAlign.Center)
  }
  @BuilderParam
  centerContent:()=>void =  this.defaultCenterParam

  @Builder
  defaultRightParam(){
    Text('确定')
  }
  @BuilderParam
  rightContent:()=>void =  this.defaultRightParam
  build() {
    Row() {
      //   左
      this.leftContent()
      //   中
      this.centerContent()
      //   右
      this.rightContent()
    }.width('100%')
    .backgroundColor(Color.Pink)
    .padding(20)
  }
}