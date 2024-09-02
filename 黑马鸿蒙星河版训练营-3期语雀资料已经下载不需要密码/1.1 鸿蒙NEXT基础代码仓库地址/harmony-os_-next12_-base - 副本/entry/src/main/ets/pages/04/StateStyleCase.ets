import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct StateStyleCase {
  @State
  canUsed: boolean = true

  build() {
    Row() {
      Column({ space: 16 }) {
        TextInput({ placeholder: '请输入账号' })
          .width('100%')
          .border({
            width: 0
          })
          .onFocus(()=>{
            promptAction.showToast({
              message:'聚焦了！'
            })
          })
          .stateStyles({
            // 2.默认状态
            // normal:{
            //   .border({
            //     width:0
            //   })
            // },
            // 1.聚焦
            focused: {
              .border({
                width: 2,
                color: '#007dfe'
              })
              .width('80%')
            }
          })
        Button('注册')
          .width('100%')
          .backgroundColor(Color.Blue)
          .enabled(this.canUsed)
          .stateStyles({
            // 禁用
            disabled: {
              .backgroundColor(Color.Black)
            },
            // 按压
            pressed: {
              .backgroundColor(Color.Green)
            }
          })
        // selected支持的并不多,有点鸡肋
        Toggle({
          type: ToggleType.Switch,
          isOn: $$this.canUsed
        })
          .selectedColor(Color.Green)
        // .stateStyles({
        //   selected:{
        //     .selectedColor(Color.Green)
        //   }
        // })
        Button('禁用/启用')
          .onClick(() => {
            this.canUsed = !this.canUsed
          })
      }
      .padding(20)
      .width('100%')
    }
    .height('100%')
  }
}