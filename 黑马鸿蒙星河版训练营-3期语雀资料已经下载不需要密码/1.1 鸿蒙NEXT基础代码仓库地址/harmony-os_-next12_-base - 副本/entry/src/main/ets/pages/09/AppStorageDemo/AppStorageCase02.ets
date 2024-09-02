@Entry
@Component
struct AppStorageCase02 {
  // @State
  // userInfo: Record<string, string> = {
  //   'nickName':'zs',
  //   'age':'18'
  // }
  // 单向改，自己改了自己会变，不会影响全局状态
  // @StorageProp('userInfo')
  // 双向改
  @StorageLink('userInfo')
  userInfo: Record<string, string> = {
    'nickName': 'zs',
    'age': '18'
  }

  // aboutToAppear(): void {
  // 第一种：API的写法
  // const userInfo = AppStorage.get<Record<string, string>>('userInfo')
  // this.userInfo = userInfo!
  // }

  build() {
    Column() {
      Row({ space: 20 }) {
        Image($r('app.media.b'))
          .width(60)
          .aspectRatio(1)
          .borderRadius(30)
        Column({ space: 10 }) {
          Text('姓名：' + this.userInfo.nickName)
          Text(`年龄：` + this.userInfo.age)
        }
      }
      .alignItems(VerticalAlign.Center)
      .padding(20)
      .width('100%')

      Button("退出")
    }
    .width('100%')
    .height('100%')
  }
}