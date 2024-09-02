import { DefaultUserList, UserInfo } from '../models/users'
import { router } from '@kit.ArkUI'

@Component
struct Connect {
  //@State 可以让UI页面实现响应式的修饰符
  // 后续如果需要添加或者删除联系人，需要
  // @State
  // DefaultUserList:UserInfo[] = DefaultUserList

  @State
  filterList: UserInfo[] = []
  @State
  @Watch('filterName')
  searchName: string = ''
  filterName(){
    this.filterList = DefaultUserList.filter((user:UserInfo)=>{
      return  user.username.includes(this.searchName)
    })
  }
  aboutToAppear(): void {
    // 一进页面要展示默认列表进入后
    this.filterList = DefaultUserList
  }
  build() {
    Column() {
      Row() {
        Search({ placeholder: '搜索', value: $$this.searchName })
          .height(30)
          .backgroundColor($r('app.color.white'))
          .borderRadius(4)
      }.width('100%')
      .padding({
        left: 10,
        right: 10
      })
      // TextInput({text:'小老'})
      List() {
        ForEach(this.filterList, (item: UserInfo) => {
          ListItem() {
            Row({ space: 10 }) {
              Image(item.avatar)
                .width(30)
                .height(30)
                .borderRadius(4)
              Column() {
                Text(item.username)
                  .fontColor($r('app.color.text_primary'))
                  .fontSize(14)
              }.layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.Center)
            }
            .width('100%')
            .height(60)
            .padding({ left: 10, right: 10 })
            .stateStyles({
              pressed: {
                .backgroundColor($r('app.color.back_color'))
              },
              normal: {
                .backgroundColor($r('app.color.white'))
              }
            })
            .onClick(()=>{
                router.pushUrl({
                  url:'pages/ChatDetail/ChatDetail',
                  params:item
                })
            })
          }
        }, (item: UserInfo) => item.user_id)
      }
      .backgroundColor(Color.White)
      .padding({
        top: 10,
        bottom: 10
      })
      .divider({
        strokeWidth: 1,
        color: $r('app.color.border_color')
      })
    }
    .height('100%')
    .padding({
      top: 20
    })
    .backgroundColor($r('app.color.back_color'))
  }
}

export default Connect