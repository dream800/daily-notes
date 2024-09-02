// interface InfoType {
import { promptAction } from '@kit.ArkUI'

//   height:number
//   weight:number
//   bold:number
// }
interface AddressInfo {
  province: string
  city: string
  area: string
}

interface PersonInfo {
  name: string
  age: string
  gender: '男' | '女'
  address: AddressInfo
}

@Entry
@Component
struct StateCase04 {
  // 1.数据类型的约束
  // username:string = '老潘'
  // age:number = 40
  // isTeacher:boolean = true
  // data:number[] = [170,170,170]
  // info:InfoType = {
  //   height:173,
  //   weight:172,
  //   bold:171
  // }
  // 2.数据改变试图也能更新
  @State
  myInfo: PersonInfo = {
    name: '小张',
    age: '20',
    gender: '女',
    address: {
      province: '广东',
      city: '广州',
      area: '天河'
    }
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(JSON.stringify(this.myInfo))
        Row() {
          Text('姓名：')
          TextInput({ text: this.myInfo.name }).layoutWeight(1)
            .onChange((value) => {
              // 1.数据已经改了！！！
              this.myInfo.name = value
            })
        }

        Row() {
          Text('年龄：')
          TextInput({ text: this.myInfo.age }).layoutWeight(1)
            .onChange((value) => {
              // 1.数据已经改了！！！
              this.myInfo.age = value
            })
        }

        Row() {
          Text('性别：')
          Select([{ value: '男' }, { value: '女' }]).layoutWeight(1)
            .value(this.myInfo.gender)
            .onSelect((index: number, value: string) => {
              this.myInfo.gender = value as '男' | '女'
            })
        }

        Row({ space: 4 }) {
          Text('地址：')
          TextInput({ text: this.myInfo.address.province }).layoutWeight(1)
            .onChange((value) => {
              // 即使被@State修饰了，也不能在第二层发生变化的时候产生改变
              this.myInfo.address.province = value
              // 4.1数据变了没？？？变了！！！
              // promptAction.showToast({
              //   message:JSON.stringify(this.myInfo)
              // })
              // 1.如果第二层及以后发生变化，也要更新第一层才生效
              // this.myInfo.address = {
              //   province: value,
              //   city: '桂林',
              //   area: '山水甲天下'
              // }
              // 2.我的目的是要一个新对象(改自己也可以生效)
              // this.myInfo = new PersonInfoModel({
              //   name:'小张',
              //   age:'20',
              //   gender:'女',
              //   address:{
              //     province:value,
              //     city:'桂林',
              //     area:'山水甲天下'
              //   }
              // })
              //   3.不new自己，只new第一层
              // this.myInfo.address = new AddressInfoModel({
              //       province:value,
              //       city:'桂林',
              //       area:'山水甲天下'
              // })
              //   4.为什么要new原来的对象
              // 4.2用改了的数据重新new一个对象出来，给回原来的第一层
              this.myInfo.address = new AddressInfoModel(this.myInfo.address)
            })
          TextInput({ text: this.myInfo.address.city }).layoutWeight(1)
            .onChange((value) => {
              this.myInfo.address.city = value
              // 这么写不行，这不是一个新对象
              // this.myInfo.address = this.myInfo.address
              this.myInfo.address = new AddressInfoModel(this.myInfo.address)
            })
          TextInput({ text: this.myInfo.address.area }).layoutWeight(1)

        }

      }
      .width('100%')
      .padding(20)
    }
    .height('100%')
  }
}

class AddressInfoModel implements AddressInfo {
  province: string = ''
  city: string = ''
  area: string = ''

  constructor(model: AddressInfo) {
    this.province = model.province
    this.city = model.city
    this.area = model.area
  }
}

class PersonInfoModel implements PersonInfo {
  name: string = ''
  age: string = ''
  gender: '男' | '女' = '男'
  address: AddressInfo = new AddressInfoModel({} as AddressInfo)

  constructor(model: PersonInfo) {
    this.name = model.name
    this.age = model.age
    this.gender = model.gender
    this.address = model.address
  }
}
