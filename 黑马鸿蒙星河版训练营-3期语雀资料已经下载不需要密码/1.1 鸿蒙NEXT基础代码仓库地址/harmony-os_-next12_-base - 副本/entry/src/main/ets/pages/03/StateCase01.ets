import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct StateCase01 {
  // 数据的定义
  // 1.数据名  -> 不能用关键字
  // 2.类型  ->  string->''  number:1234
  // 3.值 -> 符合数据类型
  user: string = ''
  password: string = ''

  // 构建页面的内容
  build() {
    Row() {
      Column({ space: 20 }) {
        TextInput({ text: this.user })
          .width('80%')
          .onChange((value) => {
            // 1.如果不在事件中监听改变更新值，那么数据是不会发生变化的
            this.user = value
          })

        TextInput({ text: this.password })
          .type(InputType.Password)
          .width('80%')
          .onChange((value) => {
            this.password = value
          })

        Button('登录')
          .width('80%')
          .onClick(() => {
            if (this.user === 'admin' && this.password === '123456') {
              promptAction.showToast({
                message: '登录成功'
              })
            } else {
              promptAction.showToast({
                message: '登录失败'
              })
            }
          })

        Button('改变user')
          .onClick(() => {
              this.user = 'pan'
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}