import { abilityAccessCtrl, AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { PreferencesClass } from '../pages/09/PreferencesDemo/PreferencesClass';

export default class EntryAbility extends UIAbility {
  // 创建
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // const manager = abilityAccessCtrl.createAtManager()
    // manager.requestPermissionsFromUser(this.context,[
    //   "ohos.permission.APPROXIMATELY_LOCATION"
    // ])
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }
  // 销毁
  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }
  // 1.ability创建，2windowStage创建  一个ability会绑定一个windowStage
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // const self: Record<string, ResourceStr> = {
    //   'avtar': $r('app.media.b'),
    //   'nickName': '一介码农',
    //   'gender': '男',
    //   'age': '18'
    // }
    //1.new LocalStorage(数据)
    // const localUserInfo = new LocalStorage(self)
    // 设置或者新增
    // localUserInfo.setOrCreate(key,val)
    // windowStage.loadContent('pages/09/PersistentStorageCase',localUserInfo);


    // PersistentStorage.persistProp('token','999')
    // const token = AppStorage.get<string>('token')
    // console.log('persistentToken',token)
    // 在ability中拿context
    // const token = PreferencesClass.getToken(this.context)
    // console.log('persistentToken',token)
    // if(token===''){
    //   windowStage.loadContent('pages/09/PreferencesDemo/PreferenceCase');
    // }else{
    //   windowStage.loadContent('pages/09/PreferencesDemo/PreferencesResult');
    // }
    windowStage.loadContent('pages/WebControlDemo/WebControlDemo', () => {
      // 异步的结果会被传入到.then的函数中当参数
      windowStage.getMainWindow().then((window) => {
        // 1.全局关闭安全区
        // window.setWindowLayoutFullScreen(true)
      })
    });

  }
  // 1.windowStage销毁，2.ability销毁  一个ability会绑定一个windowStage
  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }
  // 应用回到前台
  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }
  // 应用回到后台
  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
  // 返回键退出应用
  onBackPressed(): boolean {
    // 是否保留ability存活  true不销毁ability，下次直接打开
    // 默认是false  下次打开重新创建ability
    return true
  }
}
