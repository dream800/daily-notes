> 今日核心:
> 1. 综合案例：数据的增删改查（CRUD)
> 2. Promise


> 1. [图片素材.zip](https://www.yuque.com/attachments/yuque/0/2024/zip/38936526/1718547487064-5bc15693-6de6-4454-bc63-7671ea116f62.zip?_lake_card=%7B%22src%22%3A%22https%3A%2F%2Fwww.yuque.com%2Fattachments%2Fyuque%2F0%2F2024%2Fzip%2F38936526%2F1718547487064-5bc15693-6de6-4454-bc63-7671ea116f62.zip%22%2C%22name%22%3A%22%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90.zip%22%2C%22size%22%3A146374%2C%22ext%22%3A%22zip%22%2C%22source%22%3A%22%22%2C%22status%22%3A%22done%22%2C%22download%22%3Atrue%2C%22taskId%22%3A%22ubb1a2108-3f3d-4c00-814e-69833b632e2%22%2C%22taskType%22%3A%22transfer%22%2C%22type%22%3A%22application%2Fzip%22%2C%22mode%22%3A%22title%22%2C%22id%22%3A%22u0876e4af%22%2C%22card%22%3A%22file%22%7D)

#  案例-我的书架
> 今天首先来完成一个综合案例-我的数据，重点练习实际开发中对于数据的增删改查操作

[文档传送门](https://apifox.com/apidoc/shared-e3812a75-2d81-4388-abf4-af83a2758a9a)
![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709813211331-0c569e7c-8517-4d8c-a82b-bc0652ec5741.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_22%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%231c1e27&clientId=ufdd2c476-ab00-4&from=paste&height=866&id=u70b56775&originHeight=1732&originWidth=766&originalType=binary&ratio=2&rotation=0&showTitle=false&size=140114&status=done&style=none&taskId=u10d34bb3-d109-41ca-be37-83022a0931c&title=&width=383)
# ![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709812368137-223fb1b5-11e7-4bdc-aead-cdad93295257.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_23%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23eeecea&clientId=ufdd2c476-ab00-4&from=paste&height=434&id=n1Czf&originHeight=1746&originWidth=804&originalType=binary&ratio=2&rotation=0&showTitle=false&size=157257&status=done&style=none&taskId=u12f891a3-00b2-42ff-a97a-e35b681c952&title=&width=200)![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709812322260-ec81871e-91cd-4e76-9cd7-ade1928a19e7.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_23%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f0f0f0&clientId=ufdd2c476-ab00-4&from=paste&height=431&id=sqRj6&originHeight=1746&originWidth=810&originalType=binary&ratio=2&rotation=0&showTitle=false&size=108518&status=done&style=none&taskId=u78d0ca14-c7a9-4da8-930e-cf24fde16e0&title=&width=200)![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709812337548-1a0e3975-c266-47a8-a95c-8143ecf31cc0.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_23%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23eeeeee&clientId=ufdd2c476-ab00-4&from=paste&height=435&id=WakNt&originHeight=1746&originWidth=802&originalType=binary&ratio=2&rotation=0&showTitle=false&size=118953&status=done&style=none&taskId=u1d223c3f-cc91-481e-bd04-ae9dce7de76&title=&width=200)
## 获取图书
:::warning
核心步骤:

1. 获取图书数据
   1. aboutToAppear
      1. http模块获取图书
2. 渲染到页面上
   1. 数组-ForEach
3. 增加动画效果
   1. if(数组长度为 0)没有数据时：展示 loading 
   2. 获取数据之后：隐藏 loading
   3. 找到动画的组件
   :::
```arkts
 import { router } from '@kit.ArkUI'




export interface Book {
  id: number
  bookname: string
  author: string
  publisher: string
}

export const creator: string = 'itheima'

@Entry
@Component
struct Day02_01_BookShelf {
  creator: string = creator
  @State books: Book[] = [{
    "id": 366351,
    "bookname": "《西游记》",
    "author": "吴承恩",
    "publisher": "人民文学出版社"
  }]
  @State isLoading: boolean = true

  build() {
    Column() {
      // 头部
      this.HeaderBuilder()
      LoadingProgress()
        .width(50)

      List({ space: 15 }) {
        ForEach(this.books, (item: Book) => {
          ListItem() {
            bookItem({ data: item })
          }
          .swipeAction({
            end: () => {
              this.itemEnd(item)
            },
            edgeEffect: SwipeEdgeEffect.Spring
          })
          .onClick(() => {

          })
        })
      }
      .padding(20)
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  HeaderBuilder() {
    Row() {
      Image($r('app.media.ic_public_drawer_filled'))
        .width(20);

      Text('我的书架')
        .fontSize(25)

      Image($r('app.media.ic_public_add'))
        .width(20)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Day02_01_BookShelf_Add'
          })
        })
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .height(60)
    .padding(10)
    .border({ width: { bottom: 2 }, color: '#f0f0f0' })
    .backgroundColor(Color.White)
  }

  @Builder
  itemEnd(item: Book) {
    Row() {
      Button('删除')
        .type(ButtonType.Normal)
        .backgroundColor('#da3231')
        .onClick(() => {
          AlertDialog.show({ message: '点了删除' })
        })
        .height('100%')
    }

  }
}

@Component
struct bookItem {
  data: Partial<Book> = {}

  build() {
    Row({ space: 10 }) {
      Image($r('app.media.ic_public_cover'))
        .width(108)
        .height(108)
      Column({ space: 5 }) {

        Text('书名：' + this.data.bookname)
          .fontSize(20)
        Text('作者：' + this.data.author)
          .fontSize(14)
          .fontColor(Color.Gray)
        Blank()
        Text('出版社: ' + this.data.publisher)
          .fontSize(14)
          .fontColor(Color.Gray)
      }
      .padding({ top: 10, bottom: 10 })
      .height(108)
      .alignItems(HorizontalAlign.Start)
    }
  }
}
```
```arkts
import { curves, router } from '@kit.ArkUI'
import http from '@ohos.net.http'


interface BookResponse {
  message: string
  data: Book[]
}

export interface Book {
  id: number
  bookname: string
  author: string
  publisher: string
}

export const creator: string = 'itheima'

@Entry
@Component
struct Day02_01_BookShelf {
  creator: string = creator
  @State books: Book[] = [{
    "id": 366351,
    "bookname": "《西游记》",
    "author": "吴承恩",
    "publisher": "人民文学出版社"
  }]
  @State isLoading: boolean = true
  req: http.HttpRequest = http.createHttp()

  getData(showLoading: boolean = false) {
    if (showLoading) this.isLoading = true
    this.req.request(`https://hmajax.itheima.net/api/books?creator=${this.creator}`)
      .then(res => {
        const bookResult = JSON.parse(res.result.toString()) as BookResponse
        this.books = bookResult.data
        if (showLoading) this.isLoading = false
      })
  }

  onPageShow(): void {
    this.getData(true)
  }

  build() {
    Column() {
      // 头部
      this.HeaderBuilder()
      LoadingProgress()
        .width(50)
        .visibility(this.isLoading === true ? Visibility.Visible : Visibility.None)
        .animation({ curve: curves.springMotion() })


      List({ space: 15 }) {
        ForEach(this.books, (item: Book) => {
          ListItem() {
            bookItem({ data: item })
          }
          .swipeAction({
            end: () => {
              this.itemEnd(item)
            },
            edgeEffect: SwipeEdgeEffect.Spring
          })
          .onClick(() => {

          })
        })
      }
      .visibility(this.isLoading === false ? Visibility.Visible : Visibility.None)
      .animation({ curve: curves.springMotion() })
      .padding(20)
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  HeaderBuilder() {
    Row() {
      Image($r('app.media.ic_public_drawer_filled'))
        .width(20);

      Text('我的书架')
        .fontSize(25)

      Image($r('app.media.ic_public_add'))
        .width(20)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Day02_01_BookShelf_Add'
          })
        })
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .height(60)
    .padding(10)
    .border({ width: { bottom: 2 }, color: '#f0f0f0' })
    .backgroundColor(Color.White)
  }

  @Builder
  itemEnd(item: Book) {
    Row() {
      Button('删除')
        .type(ButtonType.Normal)
        .backgroundColor('#da3231')
        .onClick(() => {
          AlertDialog.show({ message: '点了删除' })
        })
        .height('100%')
    }

  }
}

@Component
struct bookItem {
  data: Partial<Book> = {}

  build() {
    Row({ space: 10 }) {
      Image($r('app.media.ic_public_cover'))
        .width(108)
        .height(108)
      Column({ space: 5 }) {

        Text('书名：' + this.data.bookname)
          .fontSize(20)
        Text('作者：' + this.data.author)
          .fontSize(14)
          .fontColor(Color.Gray)
        Blank()
        Text('出版社: ' + this.data.publisher)
          .fontSize(14)
          .fontColor(Color.Gray)
      }
      .padding({ top: 10, bottom: 10 })
      .height(108)
      .alignItems(HorizontalAlign.Start)
    }
  }
}
```

## 新增图书
:::warning
**核心步骤：**

1. 点击提交数据，非空判断
   1. 为空：promptAction提示
   2. 不为空：
      1. 提交，除了输入的数据以外，creator
      2. 为了便于复用，
         1. 首页：creator 提取为变量，导出
         2. 添加页：导入并使用
2. 提示用户promptAction，并返回上一页
   1. router.back()
3. 首页：
   1. aboutToAppear 页面不销毁不会重新执行
   2. 调整获取图书的逻辑到 onPageShow 中
   :::
```arkts
@Entry
@Component
struct BookShelf_Add {
  @State bookname: string = ''
  @State author: string = ''
  @State publisher: string = ''

  build() {
    Navigation() {
      Column({ space: 10 }) {
        Row() {
          Text('图书姓名:')
          TextInput({
            placeholder: '请输入图书名字',
            text: $$this.bookname
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()
        Row() {
          Text('图书作者:')
          TextInput({
            placeholder: '请输入图书作者',
            text: $$this.author
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()
        Row() {
          Text('图书出版社:')
          TextInput({
            placeholder: '请输入图书出版社',
            text: $$this.publisher
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()


        Button('保存')
          .width('100%')
          .margin({ top: 20 })
          .type(ButtonType.Normal)
          .borderRadius(10)
          .onClick(() => {
          })

      }
      .padding(20)
    }
    .title('新增图书')
    .titleMode(NavigationTitleMode.Mini)
    .backButtonIcon($r('app.media.ic_public_arrow_left'))
  }
}
```
```arkts
import { creator } from '../data/BookShelf_Constants'
import http from '@ohos.net.http'
import { Book } from './Day02_01_BookShelf_Home'
import { promptAction, router } from '@kit.ArkUI'

interface AddResponse {
  message: string
  data: Book
}

@Entry
@Component
struct Day02_01_BookShelf_Add {
  @State bookname: string = ''
  @State author: string = ''
  @State publisher: string = ''
  creator: string = creator

  build() {
    Navigation() {
      Column({ space: 10 }) {
        Row() {
          Text('图书姓名:')
          TextInput({
            placeholder: '请输入图书名字',
            text: $$this.bookname
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()
        Row() {
          Text('图书作者:')
          TextInput({
            placeholder: '请输入图书作者',
            text: $$this.author
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()
        Row() {
          Text('图书出版社:')
          TextInput({
            placeholder: '请输入图书出版社',
            text: $$this.publisher
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()


        Button('保存')
          .width('100%')
          .margin({ top: 20 })
          .type(ButtonType.Normal)
          .borderRadius(10)
          .onClick(() => {
            const req = http.createHttp()
            req.request('https://hmajax.itheima.net/api/books', {
              method: http.RequestMethod.POST,
              header: {
                contentType: 'application/json'
              },
              extraData: {
                bookname: this.bookname,
                author: this.author,
                publisher: this.publisher,
                creator: this.creator
              }
            })
              .then(res => {
                const addRes = JSON.parse(res.result.toString()) as AddResponse
                promptAction.showToast({ message: addRes.message })

                router.back()
              })
          })

      }
      .padding(20)
    }
    .title('新增图书')
    .titleMode(NavigationTitleMode.Mini)
    .backButtonIcon($r('app.media.ic_public_arrow_left'))
  }
}
```

## 删除图书
:::warning
**核心步骤：**

1. 侧滑弹框提示用户，确认调用删除接口
   1. 弹框参考  promptAction.showDialog文档使用
   2. 确认：删除图书
      1. ![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1712631165940-e2ae6248-35e6-4d6d-ad5b-2c8d899ad6aa.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_39%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fbfcfc&clientId=u833c8361-5b7b-4&from=paste&height=304&id=u10d6b254&originHeight=822&originWidth=1384&originalType=binary&ratio=2&rotation=0&showTitle=false&size=208124&status=done&style=none&taskId=u14fd1601-c61e-4d98-8706-650c86f44ed&title=&width=512)
   3. 取消：啥都不干
2. 删除成功之后重新获取图书数据
   1. 调用获取数据的方法 this.getBooks
   :::
```arkts
import { curves, router } from '@kit.ArkUI'
import http from '@ohos.net.http'


interface BookResponse {
  message: string
  data: Book[]
}

export interface Book {
  id: number
  bookname: string
  author: string
  publisher: string
}

export const creator: string = 'itheima'

@Entry
@Component
struct Day02_01_BookShelf {
  creator: string = creator
  @State books: Book[] = [{
    "id": 366351,
    "bookname": "《西游记》",
    "author": "吴承恩",
    "publisher": "人民文学出版社"
  }]
  @State isLoading: boolean = true
  req: http.HttpRequest = http.createHttp()

  getData(showLoading: boolean = false) {
    if (showLoading) this.isLoading = true
    this.req.request(`https://hmajax.itheima.net/api/books?creator=${this.creator}`)
      .then(res => {
        const bookResult = JSON.parse(res.result.toString()) as BookResponse
        this.books = bookResult.data
        if (showLoading) this.isLoading = false
      })
  }

  onPageShow(): void {
    this.getData(true)
  }

  build() {
    Column() {
      // 头部
      this.HeaderBuilder()
      LoadingProgress()
        .width(50)
        .visibility(this.isLoading === true ? Visibility.Visible : Visibility.None)
        .animation({ curve: curves.springMotion() })


      List({ space: 15 }) {
        ForEach(this.books, (item: Book) => {
          ListItem() {
            bookItem({ data: item })
          }
          .swipeAction({
            end: () => {
              this.itemEnd(item)
            },
            edgeEffect: SwipeEdgeEffect.Spring
          })
          .onClick(() => {

          })
        })
      }
      .visibility(this.isLoading === false ? Visibility.Visible : Visibility.None)
      .animation({ curve: curves.springMotion() })
      .padding(20)
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  HeaderBuilder() {
    Row() {
      Image($r('app.media.ic_public_drawer_filled'))
        .width(20);

      Text('我的书架')
        .fontSize(25)

      Image($r('app.media.ic_public_add'))
        .width(20)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Day02_01_BookShelf_Add'
          })
        })
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .height(60)
    .padding(10)
    .border({ width: { bottom: 2 }, color: '#f0f0f0' })
    .backgroundColor(Color.White)
  }

  @Builder
  itemEnd(item: Book) {
    Row() {
      Button('删除')
        .type(ButtonType.Normal)
        .backgroundColor('#da3231')
        .onClick(() => {
          promptAction.showDialog({
            title: '提示',
            message: `确认删除图书${item.bookname}?}`,
            buttons: [
              {
                text: '取消',
                color: '#000'
              },
              {
                text: '确认',
                color: '#367bf6'
              }
            ]
          })
            .then(res => {
              if (res.index === 1) {
                // 删除
                this.req.request(`https://hmajax.itheima.net/api/books/${item.id}`,
                  {
                    method: http.RequestMethod.DELETE
                  })
                  .then(res => {
                    promptAction.showToast({ message: '删除成功' })
                    this.getData()
                  })
              }

            })

        })
        .height('100%')
    }

  }
}

@Component
struct bookItem {
  data: Partial<Book> = {}

  build() {
    Row({ space: 10 }) {
      Image($r('app.media.ic_public_cover'))
        .width(108)
        .height(108)
      Column({ space: 5 }) {

        Text('书名：' + this.data.bookname)
          .fontSize(20)
        Text('作者：' + this.data.author)
          .fontSize(14)
          .fontColor(Color.Gray)
        Blank()
        Text('出版社: ' + this.data.publisher)
          .fontSize(14)
          .fontColor(Color.Gray)
      }
      .padding({ top: 10, bottom: 10 })
      .height(108)
      .alignItems(HorizontalAlign.Start)
    }
  }
}
```

## ~~全部删除~~
> 点击全部删除

:::success
**核心步骤：**

1. 找个全部删除按钮，比如顶部的左侧
2. 提示用户
   1. 确认：全部删除
      1. 循环图书数组
      2. 获取每一项的 id
      3. 依次调用删除接口
      4. 删除完毕之后，重新获取数据
      :::
## 修改图书
# ![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709812368137-223fb1b5-11e7-4bdc-aead-cdad93295257.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_23%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23eeecea&clientId=ufdd2c476-ab00-4&from=paste&height=434&id=HGl3r&originHeight=1746&originWidth=804&originalType=binary&ratio=2&rotation=0&showTitle=false&size=157257&status=done&style=none&taskId=u12f891a3-00b2-42ff-a97a-e35b681c952&title=&width=200)![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709812337548-1a0e3975-c266-47a8-a95c-8143ecf31cc0.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_23%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23eeeeee&clientId=ufdd2c476-ab00-4&from=paste&height=435&id=xHWGs&originHeight=1746&originWidth=802&originalType=binary&ratio=2&rotation=0&showTitle=false&size=118953&status=done&style=none&taskId=u1d223c3f-cc91-481e-bd04-ae9dce7de76&title=&width=200)
:::warning
**核心步骤:**

1. **首页: **点击携带 id 跳转到编辑页
2. **编辑页：**
   1. 根据 id 查询图书并渲染到页面上
   2. 修改之后点击保存，保存成功之后提示用户，并返回首页
   :::
```arkts
@Entry
@Component
struct BookShelf_Edit {
  @State bookname: string = ''
  @State author: string = ''
  @State publisher: string = ''

  aboutToAppear(): void {
   
  }

  build() {
    Navigation() {
      Column({ space: 10 }) {
        Row() {
          Text('图书姓名:')
          TextInput({
            placeholder: '请输入图书名字',
            text: $$this.bookname
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()
        Row() {
          Text('图书作者:')
          TextInput({
            placeholder: '请输入图书作者',
            text: $$this.author
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()
        Row() {
          Text('图书出版社:')
          TextInput({
            placeholder: '请输入图书出版社',
            text: $$this.publisher
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()


        Button('保存')
          .width('100%')
          .margin({ top: 20 })
          .type(ButtonType.Normal)
          .borderRadius(10)
          .onClick(() => {
          })

      }
      .padding(20)
    }
    .title('修改图书')
    .titleMode(NavigationTitleMode.Mini)
    .backButtonIcon($r('app.media.ic_public_arrow_left'))
  }
}
```
```arkts
import http from '@ohos.net.http'
import { Book } from './Day02_01_BookShelf_Home'
import { promptAction, router } from '@kit.ArkUI'
import { creator } from '../data/BookShelf_Constants'

interface GetBookResponse {
  message: string
  data: Book
}

interface BookInfo {
  id: number
}

interface EditBookResponse {
  message: string
  data: Book
}

@Entry
@Component
struct Day02_01_BookShelf_Add {
  @State bookname: string = ''
  @State author: string = ''
  @State publisher: string = ''
  bookId: number = 0
  req: http.HttpRequest = http.createHttp()

  aboutToAppear(): void {
    // 根据 id 获取详情
    this.bookId = (router.getParams() as BookInfo).id

    // 获取详情
    this.req.request(`https://hmajax.itheima.net/api/books/${this.bookId}`)
      .then(res => {
        const bookRes = JSON.parse(res.result.toString()) as GetBookResponse
        promptAction.showToast({
          message: bookRes.message
        })
        this.bookname = bookRes.data.bookname
        this.author = bookRes.data.author
        this.publisher = bookRes.data.publisher
      })
  }

  build() {
    Navigation() {
      Column({ space: 10 }) {
        Row() {
          Text('图书姓名:')
          TextInput({
            placeholder: '请输入图书名字',
            text: $$this.bookname
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()
        Row() {
          Text('图书作者:')
          TextInput({
            placeholder: '请输入图书作者',
            text: $$this.author
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()
        Row() {
          Text('图书出版社:')
          TextInput({
            placeholder: '请输入图书出版社',
            text: $$this.publisher
          })
            .height(30)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .padding({ left: 10, top: 0, bottom: 0 })
        }

        Divider()


        Button('保存')
          .width('100%')
          .margin({ top: 20 })
          .type(ButtonType.Normal)
          .borderRadius(10)
          .onClick(() => {
            AlertDialog.show({
              message: JSON.stringify({
                bookname: this.bookname,
                author: this.author,
                publisher: this.publisher,
                creator: creator
              })
            })
            this.req.request(`https://hmajax.itheima.net/api/books/${this.bookId}`, {
              method: http.RequestMethod.PUT,
              header: {
                contentType: 'application/json'
              },
              extraData: {
                bookname: this.bookname,
                author: this.author,
                publisher: this.publisher,
              }
            })
              .then(res => {
                const editRes = JSON.parse(res.result.toString()) as EditBookResponse
                promptAction.showToast({
                  message: editRes.message
                })
                setTimeout(() => {
                  router.back()
                }, 1000)
              })

          })

      }
      .padding(20)
    }
    .title('修改图书')
    .titleMode(NavigationTitleMode.Mini)
    .backButtonIcon($r('app.media.ic_public_arrow_left'))
  }
}
```

# 同步代码&异步代码
> Promise可以用来更好的管理异步代码，与异步代码相对的是同步代码，咱们先来认识一下如何区分


**同步代码：**逐行执行，需原地等待结果后，才继续向下执行
**异步代码：**调用后**耗时，**不阻塞代码继续执行，将来完成后，触发回调函数传递结果
**划重点：**异步代码的结果，通过 **回调函数** 获取

```arkts
 /**
   * 1. 同步代码
   * */
  console.log(1)
  const num = 1 + 1
  console.log(num)

  /**
   * 2. 同步+异步（定时器）
   * */
  console.log(1)
  setTimeout(() => {
    console.log(2)
  }, 1000)
  console.log(3)

  /**
   * 3. 同步+异步（网络请求）
   * */
console.log('1')

const req = http.createHttp()
req.request('https://api-vue-base.itheima.net/api/joke')
  .then((res: http.HttpResponse) => {
    console.log('3')
  })

console.log('2')

```

# Promise
> setTimeout 和 http 的 request 都是异步的操作，为什么第二个是在 then 里面传递回调函数呢？这是因为他返回的是一个 Promise 对象，后续课程中咱们会经常碰到.then的写法，为了更好的用这种写法组织异步代码，咱们来一起学习一下 Promise

## 什么是 Promise
:::warning
Promise是一种用于处理异步操作的对象，可以将异步操作转换为类似于同步操作的风格，以方便代码编写和维护
**简而言之：**Promise 用来管理异步，方便编码
:::
实际开发中如果异步操作用到了 Promise 来进行管理那么：

1. 那么获取异步操作结果（成功 or 失败）的方式都是一样的
2. 能够解决回调函数地狱（多层回调函数嵌套）

如何用 Promise 来管理异步任务呢?咱们分 3 步走：

1. 内部执行异步代码
2. 传递成功结果
3. 传递失败结果
```arkts
  // 实例化 Promise 对象
  const p = new Promise<string>(() => {
    // 执行任意代码，主要是异步
    setTimeout(() => {
      // 比如：获取随机数
      const randomNum = Math.floor(Math.random() * 100)
      console.log('随机数是:', randomNum)
    })
  })
}
```

```arkts
const p = new Promise<string>((resolve) => {
    // 执行任意代码，主要是异步
    setTimeout(() => {
      // 比如：获取随机数
      const randomNum = Math.floor(Math.random() * 100)
      resolve(randomNum.toString())
    })
  })

  p.then(res => {
    console.log('res:', res)
  })
```

```arkts
  const p = new Promise<string>((resolve,reject) => {
      // 执行任意代码，主要是异步
      setTimeout(() => {
        // 比如：获取随机数
        const randomNum = Math.floor(Math.random() * 100)
        // resolve(randomNum.toString())
        reject(randomNum.toString())
      })
    })

    p.then(res => {
      console.log('res:', res)
    },(err:string)=>{
      console.log('err:',err)
    })
```

提取一下核心代码:
```arkts
    const p = new Promise<string>((resolve, reject) => {
      // 执行任意代码，主要是异步
      // 成功 resolve(成功结果) then 执行
      // 失败 reject(失败结果) then第二个回调函数或 catch 执行
    })

    p.then(res => {}, (err: string) => {})
    // 或者
    p.then(res=>{}).catch((err:string)=>{})
```

:::warning
再来看看http模块的 request 方法,虽然无法看到源码，但是内部大概做的是这样的事情
:::
```arkts
request():Promise<string>{
  return new Promise<string>((resolve,reject)=>{
      // 发送网络请求
      // 解析结果 resolve(解析之后的结果)
  })
}
```

## Promise 的状态
> Promise 必然处于 3 种状态中的某一种，调用resolve,reject 的本质就是更改他的状态

3 种状态:

1. 待定（pending）: 初始状态，既没有被兑现，也没有被拒绝
2. 已兑现（fullfilled）: 意味着操作成功完成
3. 已拒绝（rejected）: 意味着操作失败

![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709866164735-ef1ef81e-fa65-4541-9d50-e6b3dbef745b.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_28%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f8eadd&clientId=ude2c1466-798e-4&from=paste&height=288&id=ud968578f&originHeight=458&originWidth=994&originalType=binary&ratio=2&rotation=0&showTitle=false&size=68903&status=done&style=none&taskId=u75678548-af96-4e39-95fd-17ad4eb0e0c&title=&width=624)
:::warning
注意：状态的改变不可逆
调用 resolve 之后再调用 reject，状态还是 已兑现，反之亦然
:::
```arkts
  const p = new Promise<string>((resolve, reject) => {
    resolve('success')
    reject('err')
  })

  p.then(res => {
    console.log('res:', res)
  })
    .catch((err: string) => {
      console.log('err:', err)
    })
```
## 回调函数地狱
> 如果回调函数一直【嵌套】下去，代码的可读性会非常糟糕

一般在多个异步操作【彼此依赖】的时候会出现回调函数嵌套的情况，（c 依赖 b，b 依赖 a），比如：
![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709866696056-514dea88-aced-4d22-9f7c-9045f914d594.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fafafa&clientId=ude2c1466-798e-4&from=paste&height=207&id=u92ea3d97&originHeight=247&originWidth=380&originalType=binary&ratio=2&rotation=0&showTitle=false&size=19013&status=done&style=stroke&taskId=uec6ea2f9-4b1d-4ddc-a0cb-7733316fe27&title=&width=318)
展示用的组件是:[TextPicker](https://docs.openharmony.cn/pages/v4.1/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-basic-components-textpicker.md)

1. 获取所有省份
2. 获取第一个省的所有城市
3. 获取第一个城市的所有地区

这里的数据来源于 3 个接口，【地区】 依赖于 【城市】 、【城市】 依赖于【 省】，所以代码写起来会是这样的结果
```arkts
import http from '@ohos.net.http'

interface IResponse {
  message: string
  list: string[]
}

const req = http.createHttp()
let provinces: string[] = []
let citys: string[] = []
let areas: string[] = []
req.request("https://hmajax.itheima.net/api/province")
  .then(res => {
    provinces = (JSON.parse(res.result as string) as IResponse).list
    req.request("https://hmajax.itheima.net/api/city?pname=" + encodeURIComponent(provinces[0])).then(res => {
      citys = (JSON.parse(res.result as string) as IResponse).list
      req.request("https://hmajax.itheima.net/api/area?pname=" + encodeURIComponent(provinces[0]) + "&cname=" + encodeURIComponent(citys[0]))
        .then(res => {
          areas = (JSON.parse(res.result as string) as IResponse).list
          console.log('省份', provinces)
          console.log('城市', citys)
          console.log('地区', areas)
        })
    })
  })
```
刚刚的代码化简一下:
```arkts
promise对象1.then(res1=>{
  promise对象2.then(res2=>{
    promise对象3.then(res3=>{
      promise对象4.then(res4=>{
        //.... 可以一直写下去
      })
    })
  })
})
```
:::warning
上述写法就叫做回调函数地狱
:::
## 链式编程-基本使用
> 上一节的写法较为繁琐，这一接咱们通过 Promise 的链式编程来解决这个问题1

![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709867147319-7b5d23dc-b4ab-4fdf-a001-5c96f2bbc5fe.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_36%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fd9c41&clientId=ude2c1466-798e-4&from=paste&height=132&id=e5Yw5&originHeight=264&originWidth=1252&originalType=binary&ratio=2&rotation=0&showTitle=false&size=37012&status=done&style=none&taskId=u6ce88873-cbae-41d2-8dd6-89119fd5adf&title=&width=626)
:::warning
之所以可以这么写，主要是利用了 Promise 对象的2 个特性:

1. Promise 的 then 方法会返回一个新Promise 对象
2. then 方法的返回值会影响这个 新Promise对象的结果

链式编程写出来的代码结构大概是这样子，then 和 then 之间是平级的
:::
```arkts
  promise对象
  .then(() => {
    // 略
  }).then(()=>{
    // 略
  }).then(()=>{
    // 略
  })

```

```arkts
function randomNum(delay: number): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    const num = Math.floor(Math.random() * 100)
    resolve(num.toString())
  })
}


randomNum(1000)
  .then(res => {
    console.log('随机数1：', res)
    return randomNum(2000)
  })
  .then(res => {
    console.log('随机数2：', res)
    return randomNum(3000)
  })
  .then(res => {
    console.log('随机数3：', res)
    return randomNum(3000)
  })
```
## 链式编程-实际应用
> 使用刚刚学习的链式编程来改写之前那个省市区的案例

![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709868327997-925ef2ed-27e6-4d36-9c9d-7779f2039f40.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_50%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fda855&clientId=ude2c1466-798e-4&from=paste&height=179&id=u420caa7c&originHeight=358&originWidth=1768&originalType=binary&ratio=2&rotation=0&showTitle=false&size=69570&status=done&style=stroke&taskId=u0b8c8a37-3e10-41ae-a16c-2c785778956&title=&width=884)
:::warning
核心步骤：

1. 在第一个 then 中返回新的 Promise 对象
2. 在第二个 then 中返回新的 Promise 对象
3. 以此类推
:::
```arkts
req.request('https://hmajax.itheima.net/api/province')
    .then(res => {
      const proRes = JSON.parse(res.result.toString()) as IResponse
      pList = proRes.list
      // 获取第一个省对应的城市
      return this.req.request('https://hmajax.itheima.net/api/city?pname=' + encodeURIComponent('广东省'))

    })
    .then(res => {
      const cityRes = JSON.parse(res.result.toString()) as IResponse
      cList = cityRes.list
      // url?key=value&key2=value2 格式不要写错啦
      return this.req.request(`https://hmajax.itheima.net/api/area?pname=${encodeURIComponent('广东省')}&cname=${encodeURIComponent('深圳市')}`)

    })
    .then(res => {
      const areaRes = JSON.parse(res.result.toString()) as IResponse
      aList = areaRes.list
      // 设置给 组件的数据
      this.range[0] = pList
      this.range[1] = cList
      this.range[2] = aList
      this.values = ['广东省', '深圳市', '罗湖区']
    })
```


> 今日核心:
> - async 函数、Promise静态方法

> 1. [图片素材.zip](https://www.yuque.com/attachments/yuque/0/2024/zip/38936526/1718547538332-adfb1ce7-d52b-4de6-8857-b291f3db9cca.zip?_lake_card=%7B%22src%22%3A%22https%3A%2F%2Fwww.yuque.com%2Fattachments%2Fyuque%2F0%2F2024%2Fzip%2F38936526%2F1718547538332-adfb1ce7-d52b-4de6-8857-b291f3db9cca.zip%22%2C%22name%22%3A%22%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90.zip%22%2C%22size%22%3A78942%2C%22ext%22%3A%22zip%22%2C%22source%22%3A%22%22%2C%22status%22%3A%22done%22%2C%22download%22%3Atrue%2C%22taskId%22%3A%22u49d2e711-01ab-43db-94b3-64e8263064e%22%2C%22taskType%22%3A%22transfer%22%2C%22type%22%3A%22application%2Fzip%22%2C%22mode%22%3A%22title%22%2C%22id%22%3A%22u37f2bae2%22%2C%22card%22%3A%22file%22%7D)


# async函数和 await
> Promise 虽然不用嵌套了，但是依旧有回调函数，是否可以更进一步？可以的，用 async 函数

## 核心用法
:::warning
概念：
async/await是一种用于处理异步操作的Promise语法糖，使得编写异步代码变得更加简单和易读。通过使用async关键字声明一个函数为异步函数，并使用await关键字等待Promise的解析（完成或拒绝），以同步的方式编写异步操作的代码。
:::

简化之后的代码写出来大概这样
:::warning
核心步骤：

1. async 修饰函数
2. await 等待成功（Promise 对象）
:::
```arkts
async function func() {
  // await 获取到的是 之后 Promise 对象的成功结果
  const res1 = await Promise对象1
  const res2 = await Promise对象2
  const res3 = await Promise对象3
}
func()
```
先写一个简单的例子
```arkts
function randomNum(delay: number): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    const num = Math.floor(Math.random() * 100)
    resolve(num.toString())
  })
}

// 
async function func() {
  const num1 = await randomNum(1000)
  console.log(num1)
  const num2 = await randomNum(1000)
  console.log(num2)
  const num3 = await randomNum(1000)
  console.log(num3)
  const num4 = await randomNum(1000)
  console.log(num4)
}

func()
```
:::success
**试一试：**

1. 用刚刚学习的语法，改写【聊天机器人案例】
2. 用刚刚学习的语法，改写【获取省市区数据】的案例
:::

```arkts
import http from '@ohos.net.http';

interface ProResponse {
  message: string
  list: string[]
}

@Entry
@Component
struct Page05_CallBacks {
  @State message: string = 'Hello World';
  apfruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4']
  orfruits: string[] = ['orange1', 'orange2', 'orange3', 'orange4']
  pefruits: string[] = ['peach1', 'peach2', 'peach3', 'peach4']
  // 二维数组，数组的每一项都是数组
  @State multi: string[][] = [this.apfruits, this.orfruits, this.pefruits]

  // 回调函数嵌套的写法（可读性不好，不推荐）
  func1() {
    const req = http.createHttp()
    // 1. 获取所有的省
    req.request('https://hmajax.itheima.net/api/province')
      .then(res => {
        // AlertDialog.show({
        //   message: res.result.toString()
        // })
        const proRes = JSON.parse(res.result.toString()) as ProResponse
        this.multi[0] = proRes.list // 省
        // 2. 获取某一个省下面的市 二维数组 this.multi[0] 省数组  this.multi[0][10] 省数组中的第 11 个
        req.request('https://hmajax.itheima.net/api/city?pname=' + encodeURIComponent(this.multi[0][0]))// 北京
          .then(res => {
            // AlertDialog.show({
            //   message: res.result.toString()
            // })
            const cityRes = JSON.parse(res.result.toString()) as ProResponse
            this.multi[1] = cityRes.list // 设置市

            // 3. 获取某一个市区下面的区
            // 省
            const pname = encodeURIComponent(this.multi[0][0]) // 省 北京
            // 市
            const cname = encodeURIComponent(this.multi[1][0]) // 市 对应 北京市
            req.request(`https://hmajax.itheima.net/api/area?pname=${pname}&cname=${cname}`)
              .then(res => {
                // AlertDialog.show({
                //   message: res.result.toString()
                // })
                const areaRes = JSON.parse(res.result.toString()) as ProResponse
                this.multi[2] = areaRes.list
              })
          })


      })
  }

  // 一打开就获取数据
  aboutToAppear(): void {
    const req = http.createHttp()
    req.request('https://hmajax.itheima.net/api/province')
      .then(res => {
        const proRes = JSON.parse(res.result.toString()) as ProResponse
        this.multi[0] = proRes.list // 省

        // 返回一个新的 Promise 对象
        return req.request('https://hmajax.itheima.net/api/city?pname=' + encodeURIComponent(this.multi[0][0]))
      })
      .then(res => {
        // AlertDialog.show({
        //   message: res.result.toString()
        // })
        const cityRes = JSON.parse(res.result.toString()) as ProResponse
        this.multi[1] = cityRes.list
        // 获取 省
        const pname = encodeURIComponent(this.multi[0][0])
        // 市
        const cname = encodeURIComponent(this.multi[1][0])

        return req.request(`https://hmajax.itheima.net/api/area?pname=${pname}&cname=${cname}`)
      })// 等省
      .then(res => {
        // AlertDialog.show({
        //   message: res.result.toString()
        // })
        const areaRes = JSON.parse(res.result.toString()) as ProResponse
        this.multi[2] = areaRes.list
      }) // 等市

  }

  build() {
    Column() {
      TextPicker({ range: this.multi })
        .canLoop(false) // 不能无限滚动
      Button('修改数组')
        .onClick(() => {
          this.multi[0] = ['西瓜', '菠萝']
        })
    }
    .height('100%')
  }
}
```

## 捕获错误
> 使用 async 之后需要try/catch 来捕获异常

```arkts
  try {
    // 需要被执行的语句
  } catch (error) {
    // error 接收错误信息
    // try 有错误时执行的语句
  }

```
:::success
**注意：**
try-catch可以用来捕获任意的异常，并不仅仅局限于 async 函数
:::
咱们来测试一下
```arkts
function randomNum(delay: number): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    const num = Math.floor(Math.random() * 100)
    if (num < 50) {
      resolve(num.toString())
    } else {
      reject(num.toString())
    }
  })
}

async function func() {
  try {
    const num1 = await randomNum(1000)
    console.log('func-res', num1) // 正常执行 打印 num1
  } catch (error) {
    console.log('func-error', error) // 出现错误 打印 error
  }
}

func()
```
# 案例-省市区选择
> 使用刚刚学习的 async 和 await 咱们来完成省市区选择这个例子

![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709869388268-11c90f44-ad17-4f42-a9c2-f0b74271b2cd.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_12%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23b1ada2&clientId=ude2c1466-798e-4&from=paste&height=703&id=u3369e6cd&originHeight=873&originWidth=406&originalType=binary&ratio=2&rotation=0&showTitle=false&size=59564&status=done&style=stroke&taskId=u5c3fcb96-de30-4076-a73f-84de27a8d81&title=&width=327)
```arkts
import http from '@ohos.net.http';

interface IResponse {
  message: string
  list: string[]
}


@Entry
@Component
struct Day03_06_AreaChange {
  @State message: string = '居住地选择';
  @State range: string[][] = [['北京'], ['北京市'], ['东城区']]
  @State selected: number[] = [0, 0, 0]
  // 这部分信息的目的是渲染到页面上
  @State values: string[] = ['北京', '北京市', '东城区']
  // 请求对象
  req: http.HttpRequest = http.createHttp()
  @State showSheet: boolean = false



  aboutToAppear(): void {
  }

  build() {
    Column({ space: 10 }) {
      // 标题
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
        .margin({ bottom: 20 })
      //
      Row({ space: 10 }) {
        Text('居住地:')
          .fontWeight(FontWeight.Bold)
        Text(this.values.join('/'))
          .layoutWeight(1)
          .fontColor(Color.Gray)
          .onClick(() => {
            this.showSheet = true
          })
        Image($r('app.media.ic_public_arrow_right'))
          .width(20)
      }

      Divider()
      Blank()


    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(20)
    .bindSheet($$this.showSheet, this.areaSheet(), {
      height: 300
    })
  }

  @Builder
  areaSheet() {
    Column() {
      TextPicker({
        range: this.range,
        selected: $$this.selected,
        // value: $$this.values //
      })
        .canLoop(false)
    }
  }
}
```
## 默认省市区
> 默认展示北京的信息

![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709869632563-73e4e4f1-de91-41cc-a67c-778282138563.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23131615&clientId=ude2c1466-798e-4&from=paste&height=229&id=u113e9394&originHeight=458&originWidth=400&originalType=binary&ratio=2&rotation=0&showTitle=false&size=23707&status=done&style=stroke&taskId=ub3150ca6-f7b6-4bad-86b7-60273d92c70&title=&width=200)
:::success
步骤：

1. aboutToAppear,获取 所有省，第一个省的市，第一个市的区
:::
```arkts
import http from '@ohos.net.http';

interface IResponse {
  message: string
  list: string[]
}


@Entry
@Component
struct Day03_06_AreaChange {
  // 标题
  @State message: string = '居住地选择';
  // 省市区数组
  @State range: string[][] = [['北京'], ['北京市'], ['东城区']]
  // 选中的索引
  @State selected: number[] = [0, 0, 0]
  // 这部分信息的目的是渲染到页面上
  @State values: string[] = ['北京', '北京市', '东城区']
  // 请求对象
  req: http.HttpRequest = http.createHttp()
  // 是否显示半模态
  @State showSheet: boolean = false



  build() {
    Column({ space: 10 }) {
      // 标题
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
        .margin({ bottom: 20 })
      //
      Row({ space: 10 }) {
        Text('居住地:')
          .fontWeight(FontWeight.Bold)
        Text(this.values.join('/'))
          .layoutWeight(1)
          .fontColor(Color.Gray)
          .onClick(() => {
            this.showSheet = true
          })
        Image($r('app.media.ic_public_arrow_right'))
          .width(20)
      }

      Divider()
      Blank()


    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(20)
    .bindSheet($$this.showSheet, this.areaSheet(), {
      height: 300
    })
  }

  @Builder
  areaSheet() {
    Column() {
      TextPicker({
        range: this.range,
        selected: $$this.selected,
      })
        .canLoop(false)
    }
  }
}
```


## 省市区联动效果-省
> 先来完成省份改变时，重新获取对应的市以及对应的地区的效果
> [传送门](https://docs.openharmony.cn/pages/v4.0/zh-cn/application-dev/reference/arkui-ts/ts-basic-components-textpicker.md#%E4%BA%8B%E4%BB%B6)

:::success
**需求：**

1. 选中不同的省之后，获取对应的市和区

**分析：**

1. 如何知道选中了不同的省？
   1. 找对应的事件-onChange
2. 如果市和区不是第一个，重新选中省之后需要如何处理？
   1. 市和区要还原为第一个
3. 如何获取上一次选择的【省市区】？
   1. 有一个状态变量 values 把最新选中的值保存进去
   2. onChange 触发的时候，判断 values 的值，和当前选中的值是否相同即可
   :::
```arkts
import http from '@ohos.net.http';

interface IResponse {
  message: string
  list: string[]
}


@Entry
@Component
struct Day03_06_AreaChange {
  @State message: string = '居住地选择';
  @State range: string[][] = [['北京'], ['北京市'], ['东城区']]
  @State selected: number[] = [0, 0, 0]
  // values中设置的内容必须 在 range 中存在，否则会崩溃
  @State values: string[] = ['北京', '北京市', '东城区']
  // 请求对象
  req: http.HttpRequest = http.createHttp()
  @State showSheet: boolean = false
  // 定时器 id
  timeId: number = -1

  // 获取省市区数据
  async getAllData() {
    const res1 = await this.req.request('https://hmajax.itheima.net/api/province')
    const proRes = JSON.parse(res1.result.toString()) as IResponse

    // 获取第一个省对应的城市
    const res2 = await this.req.request('https://hmajax.itheima.net/api/city?pname=' + encodeURIComponent(proRes.list[0]))

    const cityRes = JSON.parse(res2.result.toString()) as IResponse

    // url?key=value&key2=value2 格式不要写错啦
    const res3 = await this.req.request(`https://hmajax.itheima.net/api/area?pname=${encodeURIComponent(proRes.list[0])}&cname=${encodeURIComponent(cityRes.list[0])}`)
    const areaRes = JSON.parse(res3.result.toString()) as IResponse
    this.range[0] = proRes.list
    this.range[1] = cityRes.list
    this.range[2] = areaRes.list
  }

  // 链式编程写法
  aboutToAppear(): void {
    this.getAllData()
  }

  build() {
    Column({ space: 10 }) {
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
        .margin({ bottom: 20 })
      Row({ space: 10 }) {
        Text('居住地:')
          .fontWeight(FontWeight.Bold)
        Text(this.values.join('/'))
          .layoutWeight(1)
          .fontColor(Color.Gray)
          .onClick(() => {
            this.showSheet = true
          })
        Image($r('app.media.ic_public_arrow_right'))
          .width(20)
      }

      Divider()
      Blank()


    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(20)
    .bindSheet($$this.showSheet, this.areaSheet(), {
      height: 300
    })
  }

  @Builder
  areaSheet() {
    Column() {
      TextPicker({
        range: this.range,
        selected: $$this.selected,
        // value: $$this.values //
      })
        .canLoop(false)
        .onChange(async (value, index) => {
          // 获取最新选中的省市区
          const _pname = value[0]
          const res2 = await this.req.request('https://hmajax.itheima.net/api/city?pname=' + encodeURIComponent(_pname))
          const cityRes = JSON.parse(res2.result.toString()) as IResponse
          this.range[1] = cityRes.list
          this.values[0] = _pname
          this.selected[1] = 0
          // 市区应该是第一个
          this.values[1] = cityRes.list[0]
          // 基于最新的市区 获取 对应的地区
          const res3 = await this.req.request(`https://hmajax.itheima.net/api/area?pname=${encodeURIComponent(this.values[0])}&cname=${encodeURIComponent(this.values[1])}`)
          const areaRes = JSON.parse(res3.result.toString()) as IResponse
          this.range[2] = areaRes.list
          // 默认选中第一个
          this.selected[2] = 0
          // 保存最新的地区
          this.values[2] = areaRes.list[0]
        })
    }
  }
}
```
## 函数防抖
> 常见的性能优化方案 , 它可以防止高频渲染页面时出现的视觉抖动(卡顿):比如上一节写的例子里面就会有抖动效果，这里可以使用函数防抖来解决

防抖的效果:

1. 连续事件停止触发后，一段时间内如果没有再次触发，就执行业务代码

![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709870932289-2e110e38-4f44-400d-9ec8-5de0929389ff.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_17%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fcf8f8&clientId=ude2c1466-798e-4&from=paste&height=225&id=u8365e405&originHeight=217&originWidth=583&originalType=binary&ratio=2&rotation=0&showTitle=false&size=9935&status=done&style=stroke&taskId=u59229e95-aa08-4dcd-9b5f-17218f029d8&title=&width=604.5)

核心步骤：

1. 开启定时器，并保存定时器 ID
2. 清除已开启的定时器
```arkts
let timeId
clearTimeout(timeId)
timeId = setTimeout(()=>{
  // 业务代码
})
```

使用防抖改写刚刚的代码
```arkts
import http from '@ohos.net.http';

interface IResponse {
  message: string
  list: string[]
}


@Entry
@Component
struct Day03_06_AreaChange {
  @State message: string = '居住地选择';
  @State range: string[][] = [['北京'], ['北京市'], ['东城区']]
  @State selected: number[] = [0, 0, 0]
  // values中设置的内容必须 在 range 中存在，否则会崩溃
  @State values: string[] = ['北京', '北京市', '东城区']
  // 请求对象
  req: http.HttpRequest = http.createHttp()
  @State showSheet: boolean = false
  // 定时器 id
  timeId: number = -1

  // 获取省市区数据
  async getAllData() {
    const res1 = await this.req.request('https://hmajax.itheima.net/api/province')
    const proRes = JSON.parse(res1.result.toString()) as IResponse

    // 获取第一个省对应的城市
    const res2 = await this.req.request('https://hmajax.itheima.net/api/city?pname=' + encodeURIComponent(proRes.list[0]))

    const cityRes = JSON.parse(res2.result.toString()) as IResponse

    // url?key=value&key2=value2 格式不要写错啦
    const res3 = await this.req.request(`https://hmajax.itheima.net/api/area?pname=${encodeURIComponent(proRes.list[0])}&cname=${encodeURIComponent(cityRes.list[0])}`)
    const areaRes = JSON.parse(res3.result.toString()) as IResponse
    this.range[0] = proRes.list
    this.range[1] = cityRes.list
    this.range[2] = areaRes.list
  }

  // 链式编程写法
  aboutToAppear(): void {
    this.getAllData()
  }

  build() {
    Column({ space: 10 }) {
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
        .margin({ bottom: 20 })
      Row({ space: 10 }) {
        Text('居住地:')
          .fontWeight(FontWeight.Bold)
        Text(this.values.join('/'))
          .layoutWeight(1)
          .fontColor(Color.Gray)
          .onClick(() => {
            this.showSheet = true
          })
        Image($r('app.media.ic_public_arrow_right'))
          .width(20)
      }

      Divider()
      Blank()


    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(20)
    .bindSheet($$this.showSheet, this.areaSheet(), {
      height: 300
    })
  }

  @Builder
  areaSheet() {
    Column() {
      TextPicker({
        range: this.range,
        selected: $$this.selected,
        // value: $$this.values //
      })
        .canLoop(false)
        .onChange(async (value, index) => {
          clearTimeout(this.timeId)
          this.timeId = setTimeout(async () => {
            // 获取最新选中的省市区
            const _pname = value[0]
            const res2 = await this.req.request('https://hmajax.itheima.net/api/city?pname=' + encodeURIComponent(_pname))
            const cityRes = JSON.parse(res2.result.toString()) as IResponse
            this.range[1] = cityRes.list
            this.values[0] = _pname
            this.selected[1] = 0
            // 市区应该是第一个
            this.values[1] = cityRes.list[0]
            // 基于最新的市区 获取 对应的地区
            const res3 = await this.req.request(`https://hmajax.itheima.net/api/area?pname=${encodeURIComponent(this.values[0])}&cname=${encodeURIComponent(this.values[1])}`)
            const areaRes = JSON.parse(res3.result.toString()) as IResponse
            this.range[2] = areaRes.list
            // 默认选中第一个
            this.selected[2] = 0
            // 保存最新的地区
            this.values[2] = areaRes.list[0]
          }, 300)

        })
    }
  }
}
```
## 省市区联动效果-市
> 接下来完成市的联动效果

:::warning
核心步骤：

1. 改变了市：区重新获取，并选择 0
   1. 上一次的市和最新选中的市比较
      1. 改变了，重新获取区，选择 0
2. 改变了区：只需要更改页面显示
   1. 修改渲染数组的项即可
   :::
```arkts
import http from '@ohos.net.http';

interface IResponse {
  message: string
  list: string[]
}


@Entry
@Component
struct Day03_06_AreaChange {
  @State message: string = '居住地选择';
  @State range: string[][] = [['北京'], ['北京市'], ['东城区']]
  @State selected: number[] = [0, 0, 0]
  // values中设置的内容必须 在 range 中存在，否则会崩溃
  @State values: string[] = ['北京', '北京市', '东城区']
  // 请求对象
  req: http.HttpRequest = http.createHttp()
  @State showSheet: boolean = false
  // 定时器 id
  timeId: number = -1

  // 获取省市区数据
  async getAllData() {
    const res1 = await this.req.request('https://hmajax.itheima.net/api/province')
    const proRes = JSON.parse(res1.result.toString()) as IResponse

    // 获取第一个省对应的城市
    const res2 = await this.req.request('https://hmajax.itheima.net/api/city?pname=' + encodeURIComponent(proRes.list[0]))

    const cityRes = JSON.parse(res2.result.toString()) as IResponse

    // url?key=value&key2=value2 格式不要写错啦
    const res3 = await this.req.request(`https://hmajax.itheima.net/api/area?pname=${encodeURIComponent(proRes.list[0])}&cname=${encodeURIComponent(cityRes.list[0])}`)
    const areaRes = JSON.parse(res3.result.toString()) as IResponse
    this.range[0] = proRes.list
    this.range[1] = cityRes.list
    this.range[2] = areaRes.list
  }

  // 链式编程写法
  aboutToAppear(): void {
    this.getAllData()
  }

  build() {
    Column({ space: 10 }) {
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
        .margin({ bottom: 20 })
      Row({ space: 10 }) {
        Text('居住地:')
          .fontWeight(FontWeight.Bold)
        Text(this.values.join('/'))
          .layoutWeight(1)
          .fontColor(Color.Gray)
          .onClick(() => {
            this.showSheet = true
          })
        Image($r('app.media.ic_public_arrow_right'))
          .width(20)
      }

      Divider()
      Blank()


    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(20)
    .bindSheet($$this.showSheet, this.areaSheet(), {
      height: 300
    })
  }

  @Builder
  areaSheet() {
    Column() {
      TextPicker({
        range: this.range,
        selected: $$this.selected,
        // value: $$this.values //
      })
        .canLoop(false)
        .onChange(async (value, index) => {
          // this.values = value as string[]
          // 获取最新选中的省市区
          const _pname = value[0]
          const _cname = value[1]
          const _aname = value[2]
          // 基于省份 获取最新的市
          clearTimeout(this.timeId)
          // 没有开启定时器 开启定时器 并保存 id
          this.timeId = setTimeout(async () => {

            // 基于省 获取最新的市
            // 如果省 发生改变，那么重新获取对应的市区 并将选中值设置为 0
            if (_pname !== this.values[0]) {
              const res2 = await this.req.request('https://hmajax.itheima.net/api/city?pname=' + encodeURIComponent(_pname))
              const cityRes = JSON.parse(res2.result.toString()) as IResponse
              this.range[1] = cityRes.list
              this.values[0] = _pname
              this.selected[1] = 0
              // 市区应该是第一个
              this.values[1] = cityRes.list[0]
              // 基于最新的市区 获取 对应的地区
              const res3 = await this.req.request(`https://hmajax.itheima.net/api/area?pname=${encodeURIComponent(this.values[0])}&cname=${encodeURIComponent(this.values[1])}`)
              const areaRes = JSON.parse(res3.result.toString()) as IResponse
              this.range[2] = areaRes.list
              // 默认选中第一个
              this.selected[2] = 0
              // 保存最新的地区
              this.values[2] = areaRes.list[0]
              return
            }

            // 省份没变，但是 市变了
            if (_cname !== this.values[1]) {
              const res3 = await this.req.request(`https://hmajax.itheima.net/api/area?pname=${encodeURIComponent(this.values[0])}&cname=${encodeURIComponent(_cname)}`)
              const areaRes = JSON.parse(res3.result.toString()) as IResponse
              this.range[2] = areaRes.list
              this.values[1] = _cname
              // 默认选中第一个
              this.selected[2] = 0
              // 保存最新的地区
              this.values[2] = areaRes.list[0]
              return
            }

            this.values[2] = _aname

          }, 200)
        })
    }
  }
}
```
# Promise 的静态方法
> 日常开发中除了使用 Promise 对象以外，还可以通过 Promise 提供的静态方法来管理多个异步

Promise的静态方法,其中较为常见的是以下 2 个
```arkts
Promise.all() // 多个Promise，全部成功，某一个失败
Promsie.race() // 多个 Promise，第一个成功 or 失败
Promise.resolve() // 成功状态的 Promise 对象
Promise.reject()  // 失败状态的 Promise 对象
```

首先是 resolve 和 reject 这两个在封装的时候见得多一些，不需要实例化，直接就可以获取 成功 或者 拒绝 的 Promise 对象,咱们之后看到之后知道是什么即可
## Promise.resolve
> 返回一个成功原因的 Promise 对象

```arkts
Promise.resolve('成功原因')
  .then(res => {
    AlertDialog.show({ message: res })
  })
```

## Promise.reject
> 返回一个拒绝原因的 Promise 对象

```arkts
Promise.reject('拒绝原因')
  .catch((err: string) => {
    AlertDialog.show({ message: err })
  })
```

## Promisse.race
> 传入 Promise 数组，第一个成功或者失败

```arkts
const p1 = new Promise<string>((resolve, reject) => {
  setTimeout(() => {
    resolve('1')
  }, 2000)
})
const p2 = new Promise<string>((resolve, reject) => {
  setTimeout(() => {
    reject('2')
  }, 1000)
})
Promise.race([p1, p2, 'itheima']).then((res) => {
  console.log('res:', res)
}, (err:string) => {
  console.log('err:', err)
})
```
:::warning
上面 3 个方法日常开发中偶尔会出现，了解即可
:::
## Promise.all
> 这个用的最多，多个 Promise，全部成功，或者第一个失败

首先通过一个简单的代码看看如何执行
```arkts
const p1 = new Promise<string>((resolve, reject) => {
  setTimeout(() => {
    resolve('1')
  }, 2000)
})
const p2 = new Promise<string>((resolve, reject) => {
  setTimeout(() => {
    reject('2')
  }, 1000)
})
Promise.all([p1, p2, 'itheima'])
  .then((res) => {
    console.log('res:', res)
  }, (err: string) => {
    console.log('err:', err)
  })
```

来做一个小例子,获取 3 个分类的数据，全部获取到之后，打印出来
```arkts
const req = http.createHttp()
req.request('https://hmajax.itheima.net/api/category/sub?id=1005000')
req.request('https://hmajax.itheima.net/api/category/sub?id=1005002')
req.request('https://hmajax.itheima.net/api/category/sub?id=1010000')
```
```arkts
async function func(){
  const req = http.createHttp()
    const p1 = req.request('https://hmajax.itheima.net/api/category/sub?id=1005000')
    const p2 = req.request('https://hmajax.itheima.net/api/category/sub?id=1005002')
    const p3 = req.request('https://hmajax.itheima.net/api/category/sub?id=1010000')
  
    // 结果是一个数组
    const res = await Promise.all([p1, p2, p3])
  
    // 我们要的是每一项的 result
    const resList = res.map((v => v.result))
  
    // 打印
    AlertDialog.show({
      message: JSON.stringify(resList)
    })
}
```

## 案例-分类信息
![image.png](https://cdn.nlark.com/yuque/0/2024/png/639379/1709884396552-7efb1f03-12ed-4bc6-a297-783ce1d204bb.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23ebeae9&clientId=ua2fc9ebe-1748-4&from=paste&height=437&id=u1e6a1959&originHeight=873&originWidth=403&originalType=binary&ratio=2&rotation=0&showTitle=false&size=165495&status=done&style=none&taskId=u1e0b31f7-d1c5-4267-8c76-8edb7129ada&title=&width=201.5)
基于刚刚学些 Promise.all来完成上述案例
:::warning
核心步骤：

1. 获取顶级分类
   1. 获取顶级分类，children 中有 id 顶级分类 id
2. 基于顶级分类，生成 Promise 数组获取二级分类
   1. 每有一个顶级分类 id，就需要调用一次 二级分类接口
   2. 基于顶级分类 id，Promise 的数组
   3. All管理，获取到之后 渲染
3. 解析并渲染二级分类数据
:::
```arkts
import http from '@ohos.net.http';

interface TopCategoryResponse {
  message: string
  data: CategoryData[]
}

interface CategoryResponse {
  message: string
  data: CategoryData
}

interface CategoryData {
  id: string
  name: string
  picture: string
  children?: CategoryData[]
}

@Entry
@Component
struct Day03_08_GetAllCategory {
  build() {
    Column() {
      // 头部-
      this.headerBuilder()
      // 内容
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          mainContent()
        }
        .backgroundColor('#f6f6f6')
        .tabBar('首页')

        this.tabItemBuilder('小米自营')
        this.tabItemBuilder('手机数码')
        this.tabItemBuilder('小米电视')
        this.tabItemBuilder('电脑办公')
        this.tabItemBuilder('大家电')
        this.tabItemBuilder('小家电')
        this.tabItemBuilder('美食酒饮')
        this.tabItemBuilder('家居家装')
        this.tabItemBuilder('日常元素')
        this.tabItemBuilder('服装配饰')
        this.tabItemBuilder('有品海购')
        this.tabItemBuilder('手表首饰')
        this.tabItemBuilder('出行车品')
        this.tabItemBuilder('美妆个护')


      }
      .vertical(true)
      .barWidth(100)
      .barHeight('100%')
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  headerBuilder() {
    // 头部-
    Stack({ alignContent: Alignment.End }) {
      Text('分类')
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontSize(20);
      // Image($r('app.media.ic_public_search'))
      //   .width(25);
    }
    .backgroundColor(Color.White)
    .padding(15)

  }

  @Builder
  tabItemBuilder(title: string) {
    TabContent() {
      Text(title + '的内容')
        .fontSize(30)
    }
    .backgroundColor('#f6f6f6')
    .tabBar(title)
  }
}

@Component
struct mainContent {
  @State topCategoryList: CategoryData[] = [
    {
      "id": "1005000",
      "name": "居家",
      "picture": "http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-05-06/201516e3-25d0-48f5-bcee-7f0cafb14176.png",
      "children": [
        {
          "id": "1005009",
          "name": "茶咖酒具",
          "picture": "https://yanxuan.nosdn.127.net/3102b963e7a3c74b9d2ae90e4380da65.png?quality=95&imageView"
        },
        {
          "id": "1007000",
          "name": "水具杯壶",
          "picture": "https://yanxuan.nosdn.127.net/45b50d5f8afbd6fdef97314647dcb7db.png?quality=95&imageView"
        },
        {
          "id": "1017000",
          "name": "宠物食品",
          "picture": "https://yanxuan.nosdn.127.net/b42a85ef15f856081ea9f49e5f6893e2.png?quality=95&imageView"
        },
        {
          "id": "109248004",
          "name": "宠物用品",
          "picture": "https://yanxuan.nosdn.127.net/e766b09029ca00680d1e651b5cdc42bd.png?quality=95&imageView"
        }
      ]
    },
  ]
  @State isLoading: boolean = true
  req = http.createHttp()

  build() {
    Scroll() {
      if (this.isLoading) {
        LoadingProgress()
          .width(150)
          .color('#ccc')
      } else {
        Column() {
          Image($r('app.media.ic_public_category_cover'))
            .width('100%')
          List() {
            ForEach(this.topCategoryList, (item: CategoryData) => {
              ListItemGroup({ header: this.groupHeader(item.name, item.picture) }) {
                ForEach(item.children, (it: CategoryData) => {
                  ListItem() {
                    Column() {
                      Image(it.picture)// .width('80%')
                        .height(90)
                      Text(it.name)
                        .fontSize(15)
                    }
                    .width('100%')
                    .alignItems(HorizontalAlign.Center)
                  }

                })
              }
              .backgroundImagePosition({ x: '0', y: 0 })
            })
          }
          .backgroundColor(Color.White)
          .lanes(2)
          .divider({ strokeWidth: 10, color: '#f6f6f6' })
        }
        .justifyContent(FlexAlign.Start)
      }

    }
    .height('100%')
    .padding(10)
  }

  @Builder
  groupHeader(title: string, icon: string) {
    Row({ space: 5 }) {
      Text(title)
        .fontWeight(FontWeight.Bold)
      Image(icon)
        .width(20)
    }
    .width('100%')
    .padding(10)
    .backgroundColor(Color.White)
  }
}


```
```arkts
import http from '@ohos.net.http';

interface TopCategoryResponse {
  message: string
  data: CategoryData[]
}

interface CategoryResponse {
  message: string
  data: CategoryData
}

interface CategoryData {
  id: string
  name: string
  picture: string
  children?: CategoryData[]
}

@Entry
@Component
struct Day03_08_GetAllCategory {
  build() {
    Column() {
      // 头部-
      this.headerBuilder()
      // 内容
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          mainContent()
        }
        .backgroundColor('#f6f6f6')
        .tabBar('首页')

        this.tabItemBuilder('小米自营')
        this.tabItemBuilder('手机数码')
        this.tabItemBuilder('小米电视')
        this.tabItemBuilder('电脑办公')
        this.tabItemBuilder('大家电')
        this.tabItemBuilder('小家电')
        this.tabItemBuilder('美食酒饮')
        this.tabItemBuilder('家居家装')
        this.tabItemBuilder('日常元素')
        this.tabItemBuilder('服装配饰')
        this.tabItemBuilder('有品海购')
        this.tabItemBuilder('手表首饰')
        this.tabItemBuilder('出行车品')
        this.tabItemBuilder('美妆个护')


      }
      .vertical(true)
      .barWidth(100)
      .barHeight('100%')
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  headerBuilder() {
    // 头部-
    Stack({ alignContent: Alignment.End }) {
      Text('分类')
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontSize(20);
      Image($r('app.media.ic_public_search'))
        .width(25);
    }
    .backgroundColor(Color.White)
    .padding(15)

  }

  @Builder
  tabItemBuilder(title: string) {
    TabContent() {
      Text(title + '的内容')
        .fontSize(30)
    }
    .backgroundColor('#f6f6f6')
    .tabBar(title)
  }
}

@Component
struct mainContent {
  @State topCategoryList: CategoryData[] = [
    {
      "id": "1005000",
      "name": "居家",
      "picture": "http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-05-06/201516e3-25d0-48f5-bcee-7f0cafb14176.png",
      "children": [
        {
          "id": "1005009",
          "name": "茶咖酒具",
          "picture": "https://yanxuan.nosdn.127.net/3102b963e7a3c74b9d2ae90e4380da65.png?quality=95&imageView"
        },
        {
          "id": "1007000",
          "name": "水具杯壶",
          "picture": "https://yanxuan.nosdn.127.net/45b50d5f8afbd6fdef97314647dcb7db.png?quality=95&imageView"
        },
        {
          "id": "1017000",
          "name": "宠物食品",
          "picture": "https://yanxuan.nosdn.127.net/b42a85ef15f856081ea9f49e5f6893e2.png?quality=95&imageView"
        },
        {
          "id": "109248004",
          "name": "宠物用品",
          "picture": "https://yanxuan.nosdn.127.net/e766b09029ca00680d1e651b5cdc42bd.png?quality=95&imageView"
        }
      ]
    },
  ]
  @State isLoading: boolean = true
  req = http.createHttp()

  async getTopCategory() {
    const res = await this.req.request('https://hmajax.itheima.net/api/category/top')
    const topCategoryRes = JSON.parse(res.result.toString()) as TopCategoryResponse

    const proArray = topCategoryRes.data.map<Promise<http.HttpResponse>>(((v: CategoryData) => {
      return this.req.request(`https://hmajax.itheima.net/api/category/sub?id=${v.id}`)
    }))

    const allCategoryRes = await Promise.all<http.HttpResponse>(proArray)
    const resultArr = allCategoryRes.map((v: http.HttpResponse) => {
      const eachResponse = JSON.parse(v.result.toString()) as CategoryResponse
      return eachResponse.data
    })
    this.topCategoryList = resultArr

    this.isLoading = false
  }

  aboutToAppear(): void {
    this.getTopCategory()
  }

  onPageHide(): void {
    console.log('onPageHide')
  }

  build() {
    Scroll() {
      if (this.isLoading) {
        LoadingProgress()
          .width(150)
          .color('#ccc')
      } else {
        Column() {
          Image($r('app.media.ic_public_category_cover'))
            .width('100%')
          List() {
            ForEach(this.topCategoryList, (item: CategoryData) => {
              ListItemGroup({ header: this.groupHeader(item.name, item.picture) }) {
                ForEach(item.children, (it: CategoryData) => {
                  ListItem() {
                    Column() {
                      Image(it.picture)// .width('80%')
                        .height(90)
                      Text(it.name)
                        .fontSize(15)
                    }
                    .width('100%')
                    .alignItems(HorizontalAlign.Center)
                  }

                })
              }
              .backgroundImagePosition({ x: '0', y: 0 })
            })
          }
          .backgroundColor(Color.White)
          .lanes(2)
          .divider({ strokeWidth: 10, color: '#f6f6f6' })
        }
        .justifyContent(FlexAlign.Start)
      }

    }
    .height('100%')
    .padding(10)
  }

  @Builder
  groupHeader(title: string, icon: string) {
    Row({ space: 5 }) {
      Text(title)
        .fontWeight(FontWeight.Bold)
      Image(icon)
        .width(20)
    }
    .width('100%')
    .padding(10)
    .backgroundColor(Color.White)
  }
}


```



