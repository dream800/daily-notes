import { PlayNavComp } from './components/PlayNavComp'
import { WechatConsumeComp } from './components/WechatConsumeComp'

@Entry
@Component
struct ProvideDemo {
  @Provide
  isPlay:boolean = false

  @State
  list: TabInterface1[] = [
    {
    icon: $r("app.media.ic_public_message"),
    selectIcon: $r('app.media.ic_public_message_filled'),
    name: 'wechat',
    title: '微信',
  },
    {
      icon: $r('app.media.ic_public_contacts_group'),
      selectIcon: $r('app.media.ic_public_contacts_group_filled'),
      name: 'connect',
      title: '联系人',
    }, {
      icon: $r('app.media.ic_gallery_discover'),
      selectIcon: $r('app.media.ic_gallery_discover_filled'),
      name: 'discover',
      title: '发现',
    }, {
      icon: $r('app.media.ic_public_contacts'),
      selectIcon: $r('app.media.ic_public_contacts_filled'),
      name: 'my',
      title: '我的',
    }]
  // 组件内的
  @State
  currenIndex: number = 0

  @Builder
  tabBarItem(item: TabInterface1) {
    Column({ space: 6 }) {
      Image(item.name === this.list[this.currenIndex].name ? item.selectIcon : item.icon)
        .width(20)
      Text(item.title)
        .fontSize(12)
        .fontColor(item.name === this.list[this.currenIndex].name ? '#1caa20' : '#000')
    }
  }

  build() {
    Row() {
      Stack({alignContent:Alignment.Bottom}) {
      //   1.Tabs
        Tabs({ index: $$this.currenIndex }) {
          ForEach(this.list, (item: TabInterface1) => {
            TabContent() {
              //   切换展示的内容放这里
              // Text(item.title)
              if(item.name==='wechat'){
                WechatConsumeComp()
              }else if(item.name==='connect'){
                WechatConsumeComp()
              }

            }.tabBar(this.tabBarItem(item))
          })
        }.barPosition(BarPosition.End)
      //   2.back
        PlayNavComp()
          .translate({
            y:-60
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

interface TabInterface1 {
  name: string
  icon: ResourceStr
  selectIcon: ResourceStr
  title: string
}


