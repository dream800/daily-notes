import { FoodItem } from '../models'
import { CartStore } from '../utils/CartStore'
import MTCartItem from './MTCartItem'

@Component
struct MTCart {
  @Consume('showCart')
  showCart: boolean
  @StorageLink('cart_list')
  cartList: FoodItem[] = []

  build() {
    Column() {
      Blank()
        .backgroundColor('rgba(0, 0, 0, 0.7)')
        .onClick(() => {
          this.showCart = false
        })
      Column() {
        Row() {
          Text('购物车')
          Text('清空购物车')
            .fontColor($r('app.color.search_back_color'))
            .onClick(() => {
              CartStore.clearCart()
              this.showCart = false
            })
        }
        .width('100%')
        .padding(20)
        .justifyContent(FlexAlign.SpaceBetween)

        Divider().strokeWidth(1)

        List({ space: 20 }) {
          ForEach(this.cartList, (food: FoodItem) => {
            MTCartItem({
              food: food
            })
          },
            // ()=>'')//1.只会渲染一条，因为所有的id都一样
            // (food:FoodItem,index:number)=>index.toString())//2.会产生点前面删除，索引没变的不更新，但是数据会匹配不上
            // (food:FoodItem,index:number)=>JSON.stringify(food)+index)//3.鸿蒙的KEY生成的标准
            (food: FoodItem, index: number) => food.id.toString()) //4.唯一的id当成key，删除的时候只要id不变，UI不会重新更新
        }
        .padding({
          top: 10,
          left: 20,
          right: 20,
          bottom: 120
        })
      }
      .width('100%')
      .backgroundColor($r('app.color.white'))
    }
    .width('100%')
    .height('100%')
  }
}

export default MTCart