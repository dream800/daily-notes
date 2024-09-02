import { MessageTypeEnum } from '../../../models/message'

@CustomDialog
struct PreviewImage {
  controller:CustomDialogController
  url:ResourceStr = ''
  type:MessageTypeEnum = MessageTypeEnum.IMAGE
  build() {
    Column(){
      if(this.type===MessageTypeEnum.IMAGE){
        Image(this.url)
          .width('100%')
      }else if(this.type===MessageTypeEnum.VIDEO){
        Video({
          src:this.url
        })
          .loop(true)
          .autoPlay(true)
          .controls(false)
          .width('100%')
          .height('100%')
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.Center)
    .onClick(()=>{
        this.controller.close()
    })
  }
}
export default  PreviewImage