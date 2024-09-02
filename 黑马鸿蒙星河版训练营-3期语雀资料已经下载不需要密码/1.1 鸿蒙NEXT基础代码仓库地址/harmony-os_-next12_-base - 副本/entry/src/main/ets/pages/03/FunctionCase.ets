import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct FunctionCase {
  @State message: string = 'Hello World';
  // 2.组件内函数
  // clickFn: () => void = () => {
  //   promptAction.showToast({
  //     message: this.message
  //   })
  // }
  // 推荐使用箭头函数的写法：如果不用箭头函数this到底是谁不确定
  clickFn(){
    promptAction.showToast({
      message:this.message
    })
  }
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
            // 1.箭头函数(没有自己的this)
            // .onClick(()=>{
            //    this.clickFn()
            // })
          .onClick(this.clickFn.bind(this))
      }
      .width('100%')
    }
    .height('100%')
  }
}