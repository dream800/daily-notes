// @Entry
// @Component
// struct PropCase {
//   @State
//   money: number = 999999
//
//   build() {
//     Column() {
//       Text('father:' + this.money)
//       Button('存100块')
//         .onClick(() => {
//           this.money += 100
//         })
//       // ---------
//       // 父给子传值，默认只生效一次
//       PropChild({
//         money:this.money
//       })
//       PropChild()
//     }
//     .width('100%')
//   }
// }
//
// @Component
// struct PropChild {
//   // @State
//   // 用于和传入的值保持同步(单向)，如果传入的值改变也会引起UI的更新
//   // 自身可以进行修改，但是不推荐
//   // 因为父组件再次改变会覆盖自己的内容
//   @Prop
//   money: number
//
//   build() {
//     Column() {
//       Text('child:' + this.money)
//       Button('花100块')
//         .onClick(() => {
//           this.money -= 100
//         })
//     }
//     .padding(20)
//     .backgroundColor(Color.Pink)
//   }
// }



@Entry
@Component
struct PropCase {
  @State
  money1: number = 999999

  build() {
    Column() {
      Text('father:' + this.money1)
      Button('存100块')
        .onClick(() => {
          this.money1 += 100
        })
      // ---------
      // 父给子传值，默认只生效一次
      PropChild({
        money2:this.money1
      })
      // 必须得有默认值
      // PropChild()
    }
    .width('100%')
  }
}

@Component
struct PropChild {
  // @State
  // 用于和传入的值保持同步(单向)，如果传入的值改变也会引起UI的更新
  // 自身可以进行修改，但是不推荐
  // 因为父组件再次改变会覆盖自己的内容
  // @Prop
  // money: number = 0
  // 和传入的值始终保持一致(双向)，不能给初始值
  @Link
  money2:number

  build() {
    Column() {
      Text('father:' + this.money2)
      Button('花100块')
        .onClick(() => {
          this.money2 -= 100
        })
    }
    .padding(20)
    .backgroundColor(Color.Pink)
  }
}