@Entry
@Component
struct LinkCase {
  @Provide
  money:number = 0
  build() {
    Row() {
      Column() {
         Text('爷爷：'+this.money)
        Button('+10')
          .onClick(()=>{
            this.money+=10
          })
        LinkChild()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct LinkChild {
  @Consume
  money:number

  // money:string = '999'
  build() {
    Column() {
      Text('儿子：'+this.money)
      Button('+10')
        .onClick(()=>{
          this.money+=10
        })
      LinkChildChild()
    }
  }
}

@Component
struct LinkChildChild {
  @Consume
  money:number
  build() {
    Column() {
      Text('孙子：'+this.money)
      Button('+10')
        .onClick(()=>{
          this.money+=10
        })
    }
  }
}