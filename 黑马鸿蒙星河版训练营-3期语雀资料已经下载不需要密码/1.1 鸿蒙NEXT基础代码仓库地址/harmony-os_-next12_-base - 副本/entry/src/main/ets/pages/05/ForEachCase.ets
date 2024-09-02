interface OrderRecord {
  OrderName:string
  OrderAmount:number
  OrderDate:Date
}
@Entry
@Component
struct ForEachCase {
  // 定义要循环的数据
  OrderList:OrderRecord[] = [
    {
      OrderName:'给老婆买口红',
      OrderAmount:399,
      OrderDate:new Date('2024/5/11')
    },
    {
      OrderName:'给老婆买花',
      OrderAmount:99,
      OrderDate:new Date('2024/5/11')
    },
    {
      OrderName:'给自己买手机',
      OrderAmount:9999,
      OrderDate:new Date('2024/5/11')
    }
  ]

  build() {
    Column() {
      //   1.标题
      Row() {
        Text('支付记录')
      }
      .width('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .border({
        width:{
          bottom:1
        },
        color:'#f5f5f5'
      })

      //   2.列表
      Column() {
        // 一条数据(结构体)
        // Column({space:16}) {
        //   Text('给老婆买口红')
        //     .fontWeight(FontWeight.Bold)
        //   Row() {
        //     Text('￥399.00')
        //       .fontColor(Color.Red)
        //     Text('2024/5/11')
        //   }.width('100%')
        //   .justifyContent(FlexAlign.SpaceBetween)
        // }
        // .width('100%')
        // .padding(20)
        // .alignItems(HorizontalAlign.Start)
        // 使用的知识：
        // ForEach(要循环的数据(是一个数组) ，(item:类型 （ 数组的每一项）)=>{
        //     重复生成的结构体
        // })
        // 面试会问的知识：
        // ForEach(要循环的数据(是一个数组) ，(item:类型 （ 数组的每一项）)=>{
        //     重复生成的结构体
        // },生成唯一标识的函数(字符串类型：索引+结构体的字符串格式JSON.stringify(item))，宁可不写也不要乱写)

        ForEach(this.OrderList,(item:OrderRecord)=>{
          Column({space:16}) {
            Text(item.OrderName)
              .fontWeight(FontWeight.Bold)
            Row() {
              Text('￥'+item.OrderAmount.toFixed(2))
                .fontColor(Color.Red)
              Text(item.OrderDate.toLocaleDateString())
            }.width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .width('100%')
          .padding(20)
          .alignItems(HorizontalAlign.Start)
        })

      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}