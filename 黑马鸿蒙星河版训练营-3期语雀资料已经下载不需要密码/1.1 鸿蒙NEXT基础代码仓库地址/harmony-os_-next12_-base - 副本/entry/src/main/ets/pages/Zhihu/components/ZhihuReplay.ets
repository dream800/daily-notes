@Component
struct ZhihuReplay {
  @State
  content:string = ''
  // 用于发布评论
  replayContent : (content:string)=>void = ()=>{}
  build() {
    Row({space:10}) {
      TextInput({placeholder:'回复：',text:$$this.content})
        .layoutWeight(1)
        .height(40)
        .onSubmit(()=>{
          //内容：this.content
          this.replayContent(this.content)
          this.content = ''
        })
      Button('发布')
        .onClick(()=>{
            //内容：this.content
            this.replayContent(this.content)
            this.content = ''
        })
    }
    .width('100%')
    .padding({ left: 10, right: 10 })
    .height(60)
  }
}

// export default ZhihuReplay
export {
  ZhihuReplay
}