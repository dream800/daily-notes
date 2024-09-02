
@Entry
@Component
struct BuilderCase04 {
  @State
  formData: FormDataType = {
    name: '张三',
    age: '18',
    bank: '中国银行',
    money: '99999'
  }

  @Builder
  FormBuilder($$: MyFormData) {
    // 更改值吗？不能
    // 1.用$$接收传递的参数（前提是传响应式参数）
    Column({ space: 20 }) {
      TextInput({ placeholder: '请输入内容', text: $$.data123.name })
      TextInput({ placeholder: '请输入内容', text: $$.data123.age })
      TextInput({ placeholder: '请输入内容', text: $$.data123.bank })
      TextInput({ placeholder: '请输入内容', text: $$.data123.money })
    }.width('100%').padding(20)
  }

  build() {
    Row() {
      Column() {
        Text(JSON.stringify(this.formData))
        // Builder要想实现响应式数据：1@State + 2字面量对象
        this.FormBuilder({ data123: this.formData })
        Row({ space: 20 }) {
          Button('重置')
            .onClick(() => {
              this.formData = {
                name: '',
                age: '',
                bank: '',
                money: ''
              }
            })
          Button('注册')
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

interface FormDataType {
  name: string
  age: string
  bank: string
  money: string
}
interface MyFormData{
  data123:FormDataType
}