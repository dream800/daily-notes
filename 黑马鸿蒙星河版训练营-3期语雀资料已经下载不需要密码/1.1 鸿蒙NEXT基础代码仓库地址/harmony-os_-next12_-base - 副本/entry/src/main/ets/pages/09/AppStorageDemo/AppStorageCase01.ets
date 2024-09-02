import { promptAction, router } from '@kit.ArkUI'
import { common, Want } from '@kit.AbilityKit'

@Entry
@Component
struct AppStorageCase01 {
  @State
  username: string = ""
  @State
  password: string = ""

  @State
  user:Record<string,string> = { 'username':'zs','age':'18' }
  aboutToAppear(): void {
    const user = AppStorage.get<Record<string,string>>('userInfo')
    this.user = user!
  }
  login() {
    //   校验内容
    if (this.username === 'admin' && this.password === '123456') {
      //  向应用状态存贮账号信息
      const userInfo: Record<string, string> = {
        'nickName': '老潘',
        'age': '99'
      }
      const message:string = '123456'
      // 如果是第一次(或者不确定的时候)写入必须用setOrCreate
      // <Record<string, string>>代表对写入内容的类型约束
      AppStorage.setOrCreate<Record<string, string>>('userInfo',userInfo)
      // 跳转
      router.pushUrl({
        url: 'pages/09/AppStorageDemo/AppStorageCase02'
      })
      // let want:Want = {
      //   deviceId:'',
      //   bundleName:'com.example.harmonyos_next12_base',
      //   abilityName:'EntryAbility1'
      // };
      // (getContext() as common.UIAbilityContext).startAbility(want)
    } else {
      promptAction.showToast({
        message: '账号或密码错误'
      })
    }
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(JSON.stringify(this.user))
        TextInput({ placeholder: '请输入用户名', text: $$this.username })
        TextInput({ placeholder: '请输入密码', text: $$this.password })
          .type(InputType.Password)
        Button("登录")
          .width('100%')
          .onClick(() => {
            this.login()

          })
      }
      .padding(20)
      .width('100%')
    }
    .height('100%')
  }
}
