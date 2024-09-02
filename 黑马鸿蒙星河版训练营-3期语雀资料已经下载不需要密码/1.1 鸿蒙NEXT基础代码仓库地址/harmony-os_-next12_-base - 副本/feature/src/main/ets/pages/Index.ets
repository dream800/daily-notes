import { common } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State message: string = 'HAP-index';
  @StorageProp('orderId')
  orderId: number = 0

  build() {
    Row() {
      Column() {
        Text(this.message + ':' + this.orderId)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('支付')
          .onClick(()=>{
            (getContext() as common.UIAbilityContext).terminateSelfWithResult({
              resultCode:200,
              want:{
                deviceId:'',
                moduleName:'entry',
                bundleName:'com.example.harmonyos_next12_base',
                abilityName:'EntryAbility',
                parameters:{
                  payResult:true
                }
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}