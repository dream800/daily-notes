@Entry
@Component
struct SharedAnimateCase02 {
  @State message: string = 'SharedAnimateCase02';

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .sharedTransition('imageShared')
      Image($r('app.media.b'))
        .width(50)
        .position({
          x: 20,
          y: 20
        })
        .sharedTransition('imageShare',{
          duration:1000,
          delay:3000
        })

    }
    .width('100%')
    .height('100%')
  }
}