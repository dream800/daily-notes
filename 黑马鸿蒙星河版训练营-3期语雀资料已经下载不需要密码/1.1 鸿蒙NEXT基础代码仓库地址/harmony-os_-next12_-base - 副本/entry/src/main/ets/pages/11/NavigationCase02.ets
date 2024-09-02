class GoodId {
  id:number = 0
}
@Entry
@Component
struct NavigationCase02 {
  // navigation跳转的时候展示的内容
  @Builder
  navDesBuilder(name:string) {
    // 每个页面进行条件渲染的地方
    if(name==='one'){
      // 如果没有NavDestination包裹，页面内容无法加载
      // NavDestination可以理解成Navigation里面的页面
      NavDestination(){
        Text('one')
        Button('去TWO')
          .onClick(()=>{
             this.navPathStack.pushPath({
               name:'two',
               param:{
                 id:1
               } as GoodId
             })
          })
        Button('去THREE')
          .onClick(()=>{
            this.navPathStack.pushPath({
              name:'three'
            })
          })
      }.title('返回')
      .hideTitleBar(true)
    }
    else if(name==='two'){
        NavDesChild()
    }
  }
  @Provide
  navPathStack:NavPathStack = new NavPathStack()
  // API11
  build() {
    //维护一个路由栈 + 路由出口
    // 注意：页面上可以有多个navigation所以每一个需要匹配自己的stack
    Navigation(this.navPathStack) {
      Scroll() {
        Column() {
          Button('下一页')
            .onClick(() => {
              //    自行跳转
              this.navPathStack.pushPath({
                name:'one',
              })
            })
          Image($r('app.media.b'))
          Image($r('app.media.b'))
          Image($r('app.media.b'))
          Image($r('app.media.b'))
          Image($r('app.media.b'))
        }
      }
    }
    .title('西北吴彦祖')
    .titleMode(NavigationTitleMode.Free)
    .navDestination(this.navDesBuilder)
  }
}

@Component
struct NavDesChild {
  @Consume
  navPathStack:NavPathStack
  aboutToAppear(): void {
    AlertDialog.show({
      message:JSON.stringify(this.navPathStack.getParamByName('two'))
    })
  }
  build() {
    NavDestination(){
      Text('two')
      Button('去THREE')
        .onClick(()=>{
          // 只要进行pushPath是一定会进入下一个页面，但是不一定能渲染内容
          this.navPathStack.pushPath({
            name:'three'
          })
        })
    }.backButtonIcon($r('app.media.a'))
  }
}