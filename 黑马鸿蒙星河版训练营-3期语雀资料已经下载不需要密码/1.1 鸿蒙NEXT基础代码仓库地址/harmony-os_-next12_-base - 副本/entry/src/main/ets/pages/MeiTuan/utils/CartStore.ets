import { FoodItem } from '../models'

PersistentStorage.persistProp('cart_list', [])

export class CartStore {
  // static getCount(food:FoodItem){
  //   const list = AppStorage.get<FoodItem[]>('cart_list')!
  //   const index = list.findIndex((listItem: FoodItem) => listItem.id === food.id)
  //   return list[index]?.count || 0
  // }

  static addCut(food: FoodItem, flag: boolean = true) {
    // 1.读一下存储购物车列表
    const list = AppStorage.get<FoodItem[]>('cart_list')!
    // list.findIndex((listItem:FoodItem)=>{
    //    return  listItem.id === food.id
    // })
    // 2.从列表里面查有没有
    const index = list.findIndex((listItem: FoodItem) => listItem.id === food.id)
    if (flag) {
      //   3.1+
      if (index < 0) {
        //   4.1是首次添加
        // food.count//原来是库存的意思
        // 新new一个对象的原因是为了不用原来的对象的引用地址
        // 补充知识：new
        const newFood: FoodItem = new FoodItem()
        newFood.name = food.name
        newFood.count = food.count
        newFood.selectCount = 1
        newFood.price = food.price
        newFood.picture = food.picture
        newFood.id = food.id
        // food.count = 1 //重新赋值，代表的是购物车的数量
        list.unshift(newFood)
      } else {
        //   4.2添加数量
        (list[index].selectCount as number)++
        // 强制让第一层变化一下
        list.splice(index, 1, list[index])
      }
    } else {
      //  3.2 -
      //   默认为是大于0的，因为减到0的时候，我就不让减号出现了
      // list[index].count--
      (list[index].selectCount as number)--
      if (list[index].selectCount === 0) {
        list.splice(index, 1)
      } else {
        list.splice(index, 1, list[index])
      }
    }
    // 5.更新一下
    AppStorage.setOrCreate('cart_list', list)
  }

  static clearCart(){
    AppStorage.setOrCreate('cart_list',[])
  }
}