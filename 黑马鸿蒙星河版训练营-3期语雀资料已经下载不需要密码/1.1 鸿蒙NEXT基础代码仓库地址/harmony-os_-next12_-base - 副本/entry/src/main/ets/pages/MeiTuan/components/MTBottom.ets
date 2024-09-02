import { FoodItem } from '../models'

@Component
struct MTBottom {
  @Consume('showCart')
  showCart: boolean
  @StorageLink('cart_list')
  cartList: FoodItem[] = []

  getTotalCount() {
    // this.cartList.reduce((上一次计算的累加值，当前数组的每一项)=>{},初始值)
    const result = this.cartList.reduce((total, item) => {
      return total + (item.selectCount || 0)
    }, 0)
    return result.toString()
  }

  getTotalPrice() {
    const result = this.cartList.reduce((total, item) => {
      return total + ((item.selectCount || 0)) * item.price
    }, 0)
    return result.toFixed(2)
  }

  build() {
    Row() {
      Row() {
        Badge({
          value: this.getTotalCount(),
          position: BadgePosition.Right,
          style: {
            badgeSize: 18
          }
        }) {
          Image($r('app.media.ic_public_cart'))
            .width(48)
            .height(60)
            .position({
              y: -10
            })
        }
        .margin({
          left: 20,
          right: 10
        })
        .onClick(() => {
          this.showCart = !this.showCart
        })

        //   价格
        Column() {
          // span  imageSpan
          Text() {
            Span('￥')
              .fontSize(12)
            Span(this.getTotalPrice())
              .fontSize(24)
          }
          .fontColor($r('app.color.white'))

          Text('预计配送费 ￥5')
            .fontColor($r('app.color.search_font_color'))
            .fontSize(14)
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        //   结算
        Text('去结算')
          .height(50)
          .width(100)
          .backgroundColor($r('app.color.main_color'))
          .textAlign(TextAlign.Center)
          .fontWeight(FontWeight.Bold)
          .borderRadius({
            topRight: 25,
            bottomRight: 25
          })
      }
      .width('100%')
      .backgroundColor($r('app.color.bottom_back'))
      .height(50)
      .borderRadius(25)

      // 超出隐藏
      // .clip(true)
    }
    .width('100%')
    .padding(20)

  }
}

export default MTBottom