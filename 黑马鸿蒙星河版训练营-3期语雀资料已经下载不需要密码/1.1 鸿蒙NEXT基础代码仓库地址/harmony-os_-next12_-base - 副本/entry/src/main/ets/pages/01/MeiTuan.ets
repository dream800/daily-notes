// 默认导入
// import MeiTuanFooter from '../views/MeituanFooter'
// 按需导入
import { MeiTuanFooter } from '../../views/MeituanFooter'
import MeiTuanHeader from '../../views/MeiTuanHeader'
import MeiTuanMain from '../../views/MeiTuanMain'

@Entry
@Component
struct MeiTuan {
  build() {
     Column(){
       MeiTuanHeader()
       MeiTuanMain()
         .layoutWeight(1)
       MeiTuanFooter()
     }
    .height('100%')
  }
}