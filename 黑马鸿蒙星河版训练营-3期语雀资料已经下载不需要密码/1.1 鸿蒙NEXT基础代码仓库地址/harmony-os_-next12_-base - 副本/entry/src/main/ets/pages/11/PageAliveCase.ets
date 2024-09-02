@Entry
@Component
struct PageAliveCase {
  // 页面初始化
  aboutToAppear(): void {
    //   如果没有销毁只会执行一次
  }

  // 页面销毁
  aboutToDisappear(): void {
  }

  // @Entry修饰的页面多了3个周期
  // 组件不包含下面3个周期
  onPageShow(): void {
    //   页面展示的事后进行触发
    //   eg:路由跳转返回、应用后台前台切换
  }
  onPageHide(): void {
  }

  onBackPress(): boolean | void {
  }

  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}