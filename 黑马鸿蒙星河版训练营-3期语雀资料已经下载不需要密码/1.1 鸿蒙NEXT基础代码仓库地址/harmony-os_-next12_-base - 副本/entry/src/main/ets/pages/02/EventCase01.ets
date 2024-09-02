import { promptAction } from '@kit.ArkUI';

// 新手不推荐（this指向有问题）
// const login = () => {
//   promptAction.showToast({
//     message: this.name + '我要变形了！！！'
//   })
// }

@Entry
@Component
struct EventCase01 {
  // 自己定义一个方法(函数)
  // login() {
  //   promptAction.showToast({
  //     message: this.name + '我要变形了！！！'
  //   })
  // }
  // name: string = 'zs'

  build() {
    Row() {
      Column({ space: 20 }) {
        // 1.改变事件onChange->内容发生变化时的事件
        // 2.箭头函数()=>{}
        TextInput()
        TextInput({ placeholder: '请输入用户名' })
          .backgroundColor(Color.Pink)
          .onChange(() => {// 推荐写法：
            // 当事件触发的时候，这里面的事就会执行
            // 3.轻提示
            promptAction.showToast({
              message: '我要变形了！！！'
            })
          })//  进阶版写法：
            // .onChange(() => {
            //   this.login()
            // })
            // 4.提交事件
          .onSubmit(() => {
            // 5.弹层提示
            promptAction.showDialog({
              message: '我要提交了！！！'
            })
          })// 8.聚焦视角
          .onFocus(() => {
            promptAction.showToast({
              message: '我被关注了！！！'
            })
          })// 9.失去焦点
          .onBlur(() => {
            promptAction.showToast({
              message: '我被抛弃了！！！'
            })
          })
        Row() {
          Button('登录')
            .layoutWeight(1)// 6.点击事件
            .onClick(() => {
              //  7.弹层提示
              AlertDialog.show({
                message: '我要登录了！！！'
              })
            })
        }
      }
      .padding(24)
      .width('100%')
    }
    .height('100%')
  }
}