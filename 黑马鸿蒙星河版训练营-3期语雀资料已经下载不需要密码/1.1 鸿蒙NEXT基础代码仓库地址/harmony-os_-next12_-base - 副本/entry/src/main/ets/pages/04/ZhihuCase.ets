@Entry
@Component
struct ZhihuCase {
  build() {
    Column() {
      //   1.标题
      Row() {
        //   1.1箭头
        Row(){
          Image($r('sys.media.ohos_ic_public_arrow_left'))
            .width(20)
            .height(20)
        }
        .width(30)
        .aspectRatio(1)
        .backgroundColor('#f5f5f5')
        .borderRadius(30)//可以给大不能小！超出半径都一样！
        .justifyContent(FlexAlign.Center)
        //   1.2文字
        Text('评论回复')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
          .margin({
            right:30
          })
        // Row(){}
        // .width(30)
        // .aspectRatio(1)

      }
      .width('100%')
      .padding(20)
      .border({
        width:{
          bottom:1
        },
        color:'#f5f5f5'
      })
      //   2.评论容器
      Row({space:16}){
        //   2.1图
        Image($r('app.media.a'))
          .width(60)
          .borderRadius(60)
        //   2.2右侧容器
        Column({space:16}){
          // 2.2.1人名
          Text('潘神')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
          // 2.2.2评论内容
          Text('写布局的口诀是从上倒下，从左到右，从大到小，从外往里，头顶天，脚踩地！🔥')
          // 2.2.3下侧容器
          Row(){
            Text('05-10·IP:北京')
              .fontSize(12)
              .fontColor('#ccc')
            Row(){
              Image($r('app.media.ic_like'))
                .width(16)
                .fillColor('#ccc')
              Text('100')
                .fontSize(12)
                .fontColor('#ccc')
            }
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .padding(20)
      .alignItems(VerticalAlign.Top)
    }.width('100%')
  }
}