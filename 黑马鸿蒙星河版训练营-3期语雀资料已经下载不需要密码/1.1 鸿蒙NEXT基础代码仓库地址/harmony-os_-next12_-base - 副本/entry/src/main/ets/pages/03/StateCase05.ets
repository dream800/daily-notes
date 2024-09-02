import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct StateCase05 {
  // 最原始的写法：
  @State
  isChecked: boolean = false
  @State
  myDate: Date = new Date('2024-10-01')
  @State
  mySwitch:boolean = false
  build() {
    Row() {
      Column() {
        Row() {
          Text(this.isChecked + '')
          Checkbox()
            .select($$this.isChecked)
          // $$就等于onchange的时候把value给到了select里面的值
          // .onChange((value)=>{
          //   this.isChecked = value
          // })
          Button('改变')
            .onClick(() => {
              this.isChecked = !this.isChecked
            })
        }

        Divider().height(5).backgroundColor('#ccc')
        Row() {
          DatePicker({
            selected: $$this.myDate
          })
        }
        Column(){
          Text('switch-'+this.mySwitch)
          Toggle({type:ToggleType.Switch,isOn:$$this.mySwitch})
        }

      }
      .width('100%')
    }
    .height('100%')
  }
}