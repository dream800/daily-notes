@Entry
@Component
struct TabBarCase {
  @State
  list: TabInterface[] = [{
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
  tabBarItem(item: TabInterface) {
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
      Column() {
        Tabs({ index: $$this.currenIndex }) {
          ForEach(this.list, (item: TabInterface) => {
            TabContent() {
              //   切换展示的内容放这里
              // Text(item.title)
              if(item.name==='wechat'){
                ChildTab11()
              }else if(item.name==='connect'){
                ChildTab22()
              }

            }.tabBar(this.tabBarItem(item))
          })
        }.barPosition(BarPosition.End)

      }
      .width('100%')
    }
    .height('100%')
  }
}

interface TabInterface {
  name: string
  icon: ResourceStr
  selectIcon: ResourceStr
  title: string
}

@Component
struct ChildTab11 {
  build() {
    Column({ space: 6 }) {
      Text('微信')
        .fontSize(12)
        .fontColor('#1caa20')
    }
  }
}
@Component
struct ChildTab22 {
  build() {
    Column({ space: 6 }) {
      Text('联系人')
        .fontSize(12)
        .fontColor('#1caa20')
    }
  }
}