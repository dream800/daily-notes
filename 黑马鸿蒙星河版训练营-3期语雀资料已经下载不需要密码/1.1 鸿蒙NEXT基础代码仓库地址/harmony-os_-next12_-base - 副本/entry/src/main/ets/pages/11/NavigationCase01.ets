@Entry
@Component
struct NavigationCase01 {
  // API9
  build() {
      Navigation(){
        // 1.页面内容展示区域
        Column(){
          Text('API9-Navigation')
        }.padding(20)
        // 2.跳转的按钮
        NavRouter(){
          // 只能放置一个组件，多个会产生替代，不需要写跳转事件
          Button('下一页')
          Image($r('app.media.b'))
            .width(200)
          // 3.下一个页面展示的内容
          NavDestination(){
            Text('我是第二个页面')
              .fontSize(50)
            NavRouter(){
              Button('去下一个页面')
              NavDestination(){
                Text('我是第三个页面')
                  .fontSize(50)
              }
            }
          }
        }
      }
  }
}