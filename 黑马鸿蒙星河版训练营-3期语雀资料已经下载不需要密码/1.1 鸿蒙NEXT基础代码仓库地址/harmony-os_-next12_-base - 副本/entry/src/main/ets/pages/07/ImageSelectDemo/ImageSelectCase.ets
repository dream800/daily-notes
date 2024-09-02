import { ImageSelectBuilder } from './builders/ImageSelectIcon'
import { ImageListComp } from './components/ImageListComp'
import { MyCustomDialog } from './components/MyCustomDialog'

@Entry
@Component
struct ImageSelectCase {
  @State
  selectedList: ResourceStr[] = []
  // 2.注册弹层
  myCustomDialog:CustomDialogController = new CustomDialogController({
    builder:MyCustomDialog({
      selectedList:this.selectedList
    }),
    customStyle:true
  })
  @State
  showDialog: boolean = false

  // 声明局部的builder
  // 因为涉及到状态变化
  @Builder
  ImageListBuilder() {
    //   大坑：builder里面不能直接放自定义组件，需要一层系统组件包裹
    Row() {
      ImageListComp({
        selectedList:this.selectedList,
        showDialog:this.showDialog,
        maxNum:5
      })
    }
  }

  build() {
    Grid() {
      ForEach(this.selectedList, (item: ResourceStr) => {
        GridItem() {
          Image(item)
            .width('100%')
            .aspectRatio(1)
        }
        .onClick(()=>{
          this.myCustomDialog.open()
        })
      })
      // 加号按钮
      GridItem() {
        ImageSelectBuilder()
      }
      .onClick(() => {
        //   弹层展示
        // this.myCustomDialog.open()
        this.showDialog = true
      })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .columnsTemplate('1fr 1fr 1fr')
    .columnsGap(10)
    .rowsGap(10)
    // .bindSheet($$this.showDialog, this.ImageListBuilder(), {
    //   showClose: false,
    //   height: '60%'
    // })
    .bindContentCover($$this.showDialog, this.ImageListBuilder())
  }
}