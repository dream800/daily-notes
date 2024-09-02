PersistentStorage.persistProp('token','666666')
// UI层面使用
// 1.作用
// 从磁盘上去读，读不到就给666666,读到了就展示磁盘的PersistentStorage
// 2.作用
// 将AppStorage中的token属性写入到磁盘中！
@Entry
@Component
struct PersistentStorageCase {
  @StorageLink('token')
  message: string = 'Hello World';
  // aboutToAppear(): void {
  //   const token = AppStorage.get<string>('token')
  //   this.message = token!
  // }
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('登录')
          .onClick(() => {
            AppStorage.setOrCreate('token', '123456')
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}