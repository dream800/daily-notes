import { BuildParamComp } from './components/BuildParamComp'

@Entry
@Component
struct BuilderParamCase {
  @State
  leftText :string = ''
  @State
  isOn:boolean = false
  @Builder
  rightContent(){
    Toggle({
      type:ToggleType.Switch,
      isOn:$$this.isOn
    })
  }
  build() {
    Column() {
      BuildParamComp({
        //   1.数据
        // leftText:this.leftText,
        leftText:'低电量模式',
        bgc:'#ff4400'
        //   2.结构(builderParam默认写法)
        // rightContent:()=>{
        //     this.rightContent()
        // }
      }){
        this.rightContent()
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}