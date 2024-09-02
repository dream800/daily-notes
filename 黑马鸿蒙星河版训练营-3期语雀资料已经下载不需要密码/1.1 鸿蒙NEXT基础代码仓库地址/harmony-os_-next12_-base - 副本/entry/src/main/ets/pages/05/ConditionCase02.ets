enum SelectIndexType {
  NoVip,
  Vip,
  sVip
}

@Entry
@Component
struct ConditionCase02 {
  @State selectValue: string = '未开通'
  @State selectedIndex: SelectIndexType = SelectIndexType.NoVip

  build() {
    Row() {
      Column() {
        // 下拉
        Row() {
          Text('开通会员:')
          Select([{ value: '未开通' }, { value: 'VIP' }, { value: 'SVIP' }])
            .layoutWeight(1)
            .value($$this.selectValue)
            .selected($$this.selectedIndex)
        }.width('60%')

        // 内容
        Row({ space: 16 }) {
          Image($r('app.media.b')).width(30).borderRadius(15)
          Text('西北吴彦祖')
          // 没开通VIP
          if (this.selectedIndex === SelectIndexType.NoVip) {
            Text('VIP')
              .backgroundColor('#ccc')
              .MyTextStyle()
          }
          else if (this.selectedIndex === SelectIndexType.Vip) {
            // 开通VIP
            Text('VIP')
              .backgroundColor('#ffddd515')
              .MyTextStyle()
          }
          //   else if(){}  可以写多个！
          //  推荐：
          else if (this.selectedIndex === SelectIndexType.sVip) {
            // 开通SVIP
            Text('SVIP')
              .backgroundColor('#ffbc1d1d')
              .MyTextStyle()
          }
          //   也可以
          // else {
          //   // 开通SVIP
          //   Text('SVIP')
          //     .backgroundColor('#ffbc1d1d')
          //     .MyTextStyle()
          // }

        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text)
function MyTextStyle() {
  .padding({
    top: 4,
    bottom: 4,
    left: 12,
    right: 12
  })
  .fontColor('#fff')
  .borderRadius(16)
}