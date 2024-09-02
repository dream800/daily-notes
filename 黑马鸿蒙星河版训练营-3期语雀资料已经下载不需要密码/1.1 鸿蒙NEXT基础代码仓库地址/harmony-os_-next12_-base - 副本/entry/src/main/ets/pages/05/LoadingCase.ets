import HmLoading from './components/HmLoading'

@Entry
@Component
struct LoadingCase {
  @State
  isShow: boolean = true

  aboutToAppear(): void {
    //  模拟执行一个任务
    // 4.延时任务(只有一次)
    setTimeout(()=>{
        this.isShow = false
    },3*1000)
  }

  // 1.进入aboutToAppear/离开aboutToDisappear页面的周期
  // 2.定时任务(间隔一段时间执行一次)setInterval  clearInterval(id)
  // 3.延时任务(隔一段时间只执行依次)setTimeout  clearTimeout(id)

  build() {
    Row() {
      Column() {
        if (this.isShow) {
          HmLoading()
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}