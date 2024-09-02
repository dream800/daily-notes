@Preview
@Component
struct MeiTuanFooter {
  build() {
    Row(){
      Text('美团底部')
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#ffd2cf0b')
  }
}
//向外导出
// 默认导出(全部)
// export default MeiTuanFooter
// 按需导出(只导出自己想导出的)
export {
  MeiTuanFooter
}
