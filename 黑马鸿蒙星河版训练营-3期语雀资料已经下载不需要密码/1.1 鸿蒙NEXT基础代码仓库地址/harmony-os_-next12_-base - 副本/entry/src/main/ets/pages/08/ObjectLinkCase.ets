import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct ObjectLinkCase {
  // @Prop
  @State
  goodsList: ObjectLinkGoodItemModel[] = [
    new ObjectLinkGoodItemModel({
      name: '瓜子',
      price: 3,
      count: 0
    }),
    new ObjectLinkGoodItemModel({
      name: '花生',
      price: 3,
      count: 0
    }),
    new ObjectLinkGoodItemModel({
      name: '矿泉水',
      price: 3,
      count: 0
    })
  ]
  // 引用数据类型
  // [] 数组
  // {} 对象
  // [ { name : 'zs'} ]
  // {
  //    student:[ 'zs' , 'ls']
  // }

  aboutToAppear(): void {
    setTimeout(()=>{
      promptAction.showToast({
        message:JSON.stringify(this.goodsList)
      })
    },5000)
  }
  build() {
    Column() {
      // 展示外层数据的变化
      Text(JSON.stringify(this.goodsList))
      ForEach(this.goodsList, (item: ObjectLinkGoodItemModel, index: number) => {
        ObjectLinkChild({
          // 2.传递给子组件一个对象(必须是@Observerd修饰过的类new出来的对象)
          good: item
          // goodsList: this.goodsList,
          // index: index
        })
      })
    }
    .width('100%')
    .padding(20)
  }
}

@Component
struct ObjectLinkChild {
  @State
  // 3.给子组件添加一个ObjectLink
  // @ObjectLink
  good:ObjectLinkGoodItemModel = new ObjectLinkGoodItemModel({} as ObjectLinkGoodItem)
  // 要求：不能更改对象的地址
  // @Link
  // 传递的是一个引用数据类型，此时父子其实用的是同一个对象
  // goodsList: ObjectLinkGoodItemModel[]
  // 循环的时候传递了一个当前索引
  // index: number = 0

  build() {
    Row({ space: 20 }) {
      Image($r('app.media.b'))
        .width(60)
      Text(this.good.name)
      Text('￥' + this.good.price)
      Image($r('sys.media.ohos_ic_public_remove_filled'))
        .width(20)
        .aspectRatio(1)
        .onClick(() => {
          // this.good用的是父组件的对象
          this.good = new ObjectLinkGoodItemModel({
            name: '辣条',
            price: 99,
            count: 999
          })
        })
      Text(this.good.count + '')
      Image($r('sys.media.ohos_ic_public_add_norm_filled'))
        .width(20)
        .aspectRatio(1)
        .onClick(() => {
          this.good.count++
          // 这样等于给对象重新赋值地址了，会失去观察
          // this.good = new ObjectLinkGoodItemModel({
          //   name:'辣条',
          //   price:999,
          //   count:9
          // })
        })
    }
  }
}

interface ObjectLinkGoodItem {
  name: string
  price: number
  count: number
}
// 1.给这个类加一个修饰符
// @Observed
export class ObjectLinkGoodItemModel implements ObjectLinkGoodItem {
  name: string = ''
  price: number = 0
  count: number = 0

  constructor(model: ObjectLinkGoodItem) {
    this.name = model.name
    this.price = model.price
    this.count = model.count
  }
}
