import Want from '@ohos.app.ability.Want'
import { common } from '@kit.AbilityKit'

@Entry
@Component
struct StartAbilityCase {
  build() {
    Row() {
      Column() {
        Button('去支付')
          .onClick(async () => {
            let want: Want = {
              deviceId: '',
              bundleName: 'com.example.harmonyos_next12_base',
              abilityName: 'FeatureAbility',
              moduleName: 'feature',
              parameters: {
                id: Date.now()
              }
            };
            const result = await (getContext() as common.UIAbilityContext).startAbilityForResult(want)
            AlertDialog.show({
              message:JSON.stringify(result)
            })
          })

        Button('打开其他应用')
          .onClick(()=>{
            let want:Want = {
              deviceId:'',
              bundleName:'com.example.heimacloudmusic',
              abilityName:'EntryAbility'
            };
            (getContext() as common.UIAbilityContext).startAbility(want)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}