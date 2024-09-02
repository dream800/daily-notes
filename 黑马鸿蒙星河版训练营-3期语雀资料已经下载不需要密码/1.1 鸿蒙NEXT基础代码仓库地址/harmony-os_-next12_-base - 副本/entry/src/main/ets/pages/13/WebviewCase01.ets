import { request, zlib } from '@kit.BasicServicesKit'
import { promptAction, router } from '@kit.ArkUI'

@Entry
@Component
struct WebviewCase01 {
  downloadUrl: string = 'https://gitee.com/shuiruohanyu/toutiao_net/raw/master/resources/toutiao.zip'
  @State
  showProgress: boolean = false
  @State
  current: number = 0
  @State
  total: number = 0
  filePath: string = ''

  async downloadZip() {
    this.showProgress = true
    const fileName = 'toutiao.zip'
    let filePath = getContext().filesDir + '/' + fileName
    const task = await request.downloadFile(getContext(), {
      url: this.downloadUrl,
      filePath: filePath
    })

    task.on('progress', (current, total) => {
      this.current = current
      this.total = total
    })
    task.on('complete', () => {
      this.showProgress = false
      this.filePath = filePath
      this.decompressFile()
    })
    task.on('fail', () => {
      promptAction.showToast({
        message: '下载失败！'
      })
    })

  }

  // 解压文件
  async decompressFile() {
    try {
      await zlib.decompressFile(this.filePath, getContext().filesDir)
      router.pushUrl({
        url: 'pages/13/WebviewCase02'
      })
    } catch (err) {
      //   上面的代码执行失败
    }
  }

  build() {
    Row() {
      Column() {
        Button('热更新')
          .onClick(() => {
            this.downloadZip()
          })
        if (this.showProgress) {
          Progress({
            value: this.current,
            total: this.total
          })
            .width('100%')
        }

      }
      .width('100%')
    }
    .height('100%')
  }
}