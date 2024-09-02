// import ZhihuComment from './components/ZhihuComment'
// import ZhihuNavBar from './components/ZhihuNavBar'
// import ZhihuReplay from './components/ZhihuReplay'
import { ZhihuComment, ZhihuNavBar, ZhihuReplay } from './components'
import { ReplyItemModel } from './models'
import { promptAction } from '@kit.ArkUI'


@Entry
@Component
struct Zhihu {
  // 当前评论的内容
  @State
  currentComment: ReplyItemModel = new ReplyItemModel({
    id: 999,
    author: '老潘',
    avatar: 'https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png',
    likeNum: 999999,
    time: '05-11',
    area: '北京',
    likeFlag: true,
    content: '写页面要头顶天，脚踩地！'
  })
  // 当前评论回复的内容
  @State
  commentList: ReplyItemModel[] = [
    new ReplyItemModel({
      id: 1,
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: '偏执狂-妄想家',
      content: '更何况还分到一个摩洛哥[惊喜]',
      time: '11-30',
      area: '海南',
      likeNum: 34,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 2,
      avatar: 'https://pic1.zhimg.com/v2-5a3f5190369ae59c12bee33abfe0c5cc_xl.jpg?source=32738c0c',
      author: 'William',
      content: '当年希腊可是把1：0发挥到极致了',
      time: '11-29',
      area: '北京',
      likeNum: 58,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 3,
      avatar: 'https://picx.zhimg.com/v2-e6f4605c16e4378572a96dad7eaaf2b0_l.jpg?source=06d4cd63',
      author: 'Andy Garcia',
      content: '欧洲杯其实16队球队打正赛已经差不多，24队打正赛意味着正赛阶段在小组赛一样有弱队。',
      time: '11-28',
      area: '上海',
      likeNum: 10,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 4,
      avatar: 'https://picx.zhimg.com/v2-53e7cf84228e26f419d924c2bf8d5d70_l.jpg?source=06d4cd63',
      author: '正宗好鱼头',
      content: '确实眼红啊，亚洲就没这种球队，让中国队刷',
      time: '11-27',
      area: '香港',
      likeNum: 139,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 5,
      avatar: 'https://pic1.zhimg.com/v2-eeddfaae049df2a407ff37540894c8ce_l.jpg?source=06d4cd63',
      author: '柱子哥',
      content: '我是支持扩大的，亚洲杯欧洲杯扩到32队，世界杯扩到64队才是好的，世界上有超过200支队伍，欧洲区55支队伍，亚洲区47支队伍，即使如此也就六成出现率',
      time: '11-27',
      area: '旧金山',
      likeNum: 29,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 6,
      avatar: 'https://picx.zhimg.com/v2-fab3da929232ae911e92bf8137d11f3a_l.jpg?source=06d4cd63',
      author: '飞轩逸',
      content: '禁止欧洲杯扩军之前，应该先禁止世界杯扩军，或者至少把亚洲名额一半给欧洲。',
      time: '11-26',
      area: '里约',
      likeNum: 100,
      likeFlag: false
    })
  ]

  scroller:Scroller = new Scroller()

  // 点赞
  changeLike(childItem: ReplyItemModel) {
    //改变list里面的数据?改谁的？
    // if(childItem.likeFlag){
    //   childItem.likeNum--
    // }else{
    //   childItem.likeNum++
    // }
    // childItem.likeFlag = !childItem.likeFlag
    // index是在列表中查找id的索引 ， 查不到会返回-1 查到了就是索引0123456
    let index = this.commentList.findIndex((item: ReplyItemModel) => {
      return item.id === childItem.id
    })
    if (index < 0) {
      // 评论的点赞
      if (this.currentComment.likeFlag) {
        this.currentComment.likeNum--
      } else {
        this.currentComment.likeNum++
      }
      this.currentComment.likeFlag = !this.currentComment.likeFlag
    } else {
      //  评论的列表点赞
      if (this.commentList[index].likeFlag) {
        this.commentList[index].likeNum--
      } else {
        this.commentList[index].likeNum++
      }
      this.commentList[index].likeFlag = !this.commentList[index].likeFlag
      // 上一行代码已经把数据改了!只不过视图没更新！
      // this.commentList[index] = new ReplyItemModel(this.commentList[index])
    }

  }

  // 回复内容
  replayContent(content: string) {
    //  content
    this.commentList.unshift(new ReplyItemModel({
      avatar: 'https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png',
      author: '老潘',
      id: Math.random(),
      content: content,
      time: '05-13',
      area: '北京',
      likeNum: 0,
      likeFlag: false
    }))
    //   滚动到顶部
    this.scroller.scrollEdge(Edge.Top)
  }

  build() {
    Column() {
      ZhihuNavBar()
      ZhihuComment({
        childItem: this.currentComment,
        // changeLike: (childItem: ReplyItemModel) => {
        //   this.changeLike(childItem)
        // }
      })
      Divider().strokeWidth(6)
      // 回复区域
      Row() {
        Text(`回复(${this.commentList.length})`)
      }.width('100%').padding(16)

      // List里面只能放ListItem
      List({scroller:this.scroller}) {
        ForEach(this.commentList, (fatherItem: ReplyItemModel) => {
          ListItem() {
            ZhihuComment({
              childItem: fatherItem
            })
          }
        })
      }
      .layoutWeight(1)

      //   回复输入框
      ZhihuReplay({
        replayContent: (content: string) => {
          this.replayContent(content)
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}


