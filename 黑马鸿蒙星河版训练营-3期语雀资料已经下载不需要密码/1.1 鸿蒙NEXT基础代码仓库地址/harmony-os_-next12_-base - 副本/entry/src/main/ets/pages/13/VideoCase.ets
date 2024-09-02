@Entry
@Component
struct VideoCase {
  build() {
    Row() {
      Column() {
         Tabs(){
           TabContent(){
             Video({
               src:'https://video19.ifeng.com/video09/2024/05/23/p7199260608686989961-0-122707.mp4'
             })
           }.tabBar('在线视频')
           TabContent(){
             Video({
               src:$rawfile('1.mp4')
             })
           }.tabBar('本地视频')
         }
      }
      .width('100%')
    }
    .height('100%')
  }
}