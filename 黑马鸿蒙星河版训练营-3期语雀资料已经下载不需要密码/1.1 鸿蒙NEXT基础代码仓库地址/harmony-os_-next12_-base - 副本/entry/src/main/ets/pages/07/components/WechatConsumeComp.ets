import { PlayControlComp } from './PlayControlComp'
@Component
struct WechatConsumeComp {
  build() {
      Column(){
        PlayControlComp()
      }
  }
}

export { WechatConsumeComp }