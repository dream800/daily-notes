import { TabBarClass } from '../models/tab'
import Connect from './Connect'
import Find from './Find'
import My from './Mine'
import WeChat from './WeChat'

@Entry
@Component
struct Index {
  @State
  tabList: TabBarClass[] = [{
    icon: $r('app.media.ic_public_message'),
    name: 'wechat',
    title: '微信',
    selectIcon: $r('app.media.ic_public_message_filled')
  }, {
    icon: $r('app.media.ic_public_contacts_group'),
    name: 'connect',
    title: '联系人',
    selectIcon:  $r('app.media.ic_public_contacts_group_filled')
  }, {
    icon: $r('app.media.ic_gallery_discover'),
    name: 'discover',
    title: '发现',
    selectIcon: $r('app.media.ic_gallery_discover_filled')
  }, {
    icon: $r('app.media.ic_public_contacts'),
    name: 'my',
    title: '我的',
    selectIcon: $r('app.media.ic_public_contacts_filled')
  }]
  @State
  currentIndex: number = 0
  @Builder
  CommonTabBar (item: TabBarClass) {
    Column () {
      Image(this.tabList[this.currentIndex].name === item.name ? item.selectIcon : item.icon )
        .width(20)
        .height(20)
      Text(item.title)
        .fontSize(12)
        .fontColor(item.name === this.tabList[this.currentIndex].name  ? $r('app.color.primary') : $r('app.color.text_primary'))
        .margin({
          top: 5
        })
    }
  }
  build() {
    Tabs({ index: $$this.currentIndex }) {
      ForEach(this.tabList, (item: TabBarClass) => {
        TabContent() {
          if(item.name==='connect'){
            Connect()
          }else if(item.name === 'wechat') {
            WeChat()
          }else if(item.name==='my'){
            My()
          }else if(item.name==='discover'){
            Find()
          }
        }.tabBar(this.CommonTabBar(item))

      }, (item: TabBarClass) => item.name.toString())
    }.barPosition(BarPosition.End)
    .animationDuration(300)
  }
}