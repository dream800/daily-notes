@Entry
@Component
struct RequireCase {
  @State
  message: string = 'Hello World';

  @Builder
  parentContent(){
    Text('builderParam')
  }
  build() {
    Row() {
      Column() {
        RequireChild({
          message: this.message
        }){
          this.parentContent()
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}


@Component
struct RequireChild {
  // 1.Prop
  @Require
  @Prop
  message: string
  // 2.BuilderParam
  @Require
  @BuilderParam
  defaultContent: () => void
  build() {
    Column() {
      Text(this.message)
      this.defaultContent()
    }
  }
}