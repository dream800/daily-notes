// 1.引入可以共享的数据
// import { localUserInfo } from './LocalStorageModel'
import { router } from '@kit.ArkUI'
import { common, Want } from '@kit.AbilityKit'

//1.new LocalStorage(数据)
// const localUserInfo = new LocalStorage(self)
const localUserInfo = LocalStorage.getShared()

// 2.传递给页面
@Entry(localUserInfo)
@Component
struct LocalStorageCase01 {
  // 3.使用localUserInfo

  @LocalStorageLink('avtar')
  avtar: ResourceStr = ''
  @LocalStorageLink('nickName')
  nickName: ResourceStr = ''
  @LocalStorageLink('gender')
  gender: ResourceStr = ''
  @LocalStorageLink('age')
  age: ResourceStr = ''

  build() {
    Column() {
      Row() {
        Image($r('sys.media.ohos_ic_back'))
          .width(20)
          .aspectRatio(1)
        Text('个人信息1')
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('确定')
          .onClick(() => {
            // 页面跳转
            router.pushUrl({
              url: 'pages/08/LocalStorageDemo/LocalStorageCase02'
            })

            // localUserInfo.setOrCreate()
            // UIAbility跳转
            //     1.准备一个跳转信息
            // let want:Want = {
            //   'deviceId':'',
            //   'bundleName':'com.example.harmonyos_next12_base',
            //   'abilityName':'EntryAbility1'
            // };
            // //   坑：上面要带分号
            // //   getContext()获取上下文
            // (getContext() as common.UIAbilityContext).startAbility(want)
          })
      }.width('100%')
      .padding(20)
      .alignItems(VerticalAlign.Center)

      Row() {
        Text('头像：')
        Image(this.avtar)
          .width(40)
      }.width('100%')
      .padding(20)
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text('昵称：')
        TextInput({ text: $$this.nickName })
          .textAlign(TextAlign.End)
          .layoutWeight(1)
          .backgroundColor('#fff')
          .padding({
            right: 0
          })
      }.width('100%')
      .padding(20)
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text('性别：')
        TextInput({ text: $$this.gender })
          .textAlign(TextAlign.End)
          .layoutWeight(1)
          .backgroundColor('#fff')
          .padding({
            right: 0
          })
      }.width('100%')
      .padding(20)
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text('年龄：')
        TextInput({ text: $$this.age })
          .textAlign(TextAlign.End)
          .layoutWeight(1)
          .backgroundColor('#fff')
          .padding({
            right: 0
          })
      }.width('100%')
      .padding(20)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .height('100%')
  }
}