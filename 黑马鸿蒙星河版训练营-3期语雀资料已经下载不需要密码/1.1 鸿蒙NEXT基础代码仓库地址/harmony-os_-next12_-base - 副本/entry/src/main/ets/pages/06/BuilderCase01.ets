@Entry
@Component
struct BuilderCase01 {
  @State
  list:string[] = ['A','B','C','D']
  // 组件内的builder
  @Builder
  MyBuilderOption (item:string){
      Row() {
        Text(`${item}.选项${item}`)
          .MyTextColor()
      }
      .MyOptionStyle()
  }
  build() {
    Row() {
      Column({space:20}) {

        // MyChildOption()
        // MyChildOption()
        // Row(){
        //   MyBuilderOption()
        // }



        // Row() {
        //   Text('A.选项')
        //     .MyTextColor()
        // }
        // .MyOptionStyle()

        ForEach(this.list,(item:string)=>{
          this.MyBuilderOption(item)
        })


      }
      .width('100%')
      .padding(20)
    }
    .height('100%')
  }
}
// 1.@Styles封装组件的时候拓展通用样式
@Styles
function MyOptionStyle(){
  .width('100%')
  .padding(20)
  .backgroundColor(Color.Pink)
  .borderRadius(6)
}
// 单独组件定制化的样式设置
@Extend(Text)
function MyTextColor (){
  .fontColor('#fff')
}

// 1.可以写结构！
// 全局的Builder
// @Builder
// function MyBuilderOption (item:string){
//   Row() {
//     Text(`${item}.选项${item}`)
//       .MyTextColor()
//   }
//   .MyOptionStyle()
// }

// 有状态组件！
// @Component
// struct MyChildOption {
//   @State
//   message:string = 'B.选项'
//   build() {
//     Row() {
//       Text(this.message)
//     }
//     .MyOptionStyle()
//   }
// }