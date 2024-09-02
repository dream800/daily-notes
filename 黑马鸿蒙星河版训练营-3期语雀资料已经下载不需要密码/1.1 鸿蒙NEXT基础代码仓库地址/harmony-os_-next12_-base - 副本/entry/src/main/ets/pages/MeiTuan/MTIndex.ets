import { getData } from './api';
import MTBottom from './components/MTBottom';
import MTCart from './components/MTCart';
import MTMain from './components/MTMain';
import MTTop from './components/MTTop';
import { Category } from './models';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct MTIndex {
  @State
  list:Category[] = []
  @Provide
  showCart: boolean = false

  // 页面监听返回按键
  onBackPress(): boolean | void {
    // 如果没有返回值代表自己处理返回业务
    if(this.showCart){
      this.showCart = false
      return true
    }
    // else{
    //   return false
    // }
  }
  async aboutToAppear(){
    this.list = await getData()
  }
  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        MTTop()
        MTMain({
          list:this.list
        })
          .layoutWeight(1)
      }.width('100%')
      .height('100%')

      if (this.showCart) {
        MTCart()
      }

      MTBottom()
    }
    .width('100%')
    .height('100%')
  }
}