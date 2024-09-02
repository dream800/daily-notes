import { GoodItemBuilder } from '../HmList'

@Component
struct GoodItem {
  // 1.数据
  @State
  goodItemList: object[] = []
  // 2.接收结构
  @BuilderParam
  renderItem: (item: object) => void

  build() {
    Column() {
      // 如果没有默认值最好判断一下
      ForEach(this.goodItemList, (item: object) => {
        if (this.renderItem) {
          this.renderItem(item)
        }
      })
    }
  }
}

export { GoodItem }