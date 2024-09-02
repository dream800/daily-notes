import { PreferencesClass } from './PreferencesClass';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct PreferenceCase {
  @State message: string = '暂未登录！';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('登录')
          .onClick(() => {
            PreferencesClass.setToken(getContext(), '123456')
            AlertDialog.show({
              message: '登录成功！'
            })
            router.pushUrl({
              url:'pages/09/PreferencesDemo/PreferencesResult'
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}