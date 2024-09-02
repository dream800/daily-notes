import { VoiceRecordEnum } from '../../../models/voice'
import { emitter } from '@kit.BasicServicesKit'

@Component
struct VoiceInput {
  @Consume
  voiceState: VoiceRecordEnum
  @Consume
  transText: string
  @State
  list: number[] = []

  @Builder
  getDisplayContent() {
    if (this.voiceState === VoiceRecordEnum.Cancel) {
      Row()
        .height(80)
        .width(100)
        .borderRadius(20)
        .backgroundColor($r('app.color.danger'))
        .margin({
          left: 30
        })
    }
    if (this.voiceState === VoiceRecordEnum.Recording) {
      Row({ space: 2 }) {
        ForEach(this.list, (item: number) => {
          Row()
            .height(item)
            .width(2)
            .borderRadius(1)
            .backgroundColor($r('app.color.animate_voice_color'))
        })
      }
      .height(80)
      .width(180)
      .borderRadius(20)
      .backgroundColor($r('app.color.chat_primary'))
      .justifyContent(FlexAlign.Center)
    }

    if (this.voiceState === VoiceRecordEnum.Transfer) {
      Row() {
        Text(this.transText)
          .fontSize(20)
          .fontColor($r('app.color.primary'))
      }
      .height(120)
      .width(280)
      .borderRadius(20)
      .backgroundColor($r('app.color.chat_primary'))
    }
  }

  // 通过buffer计算要展示的播放
  calcVoice(buffer: ArrayBuffer) {
    // 比特bit ?   0 1
    // 字节byte ?  8个bit    00000000~11111111  256
    // 16进制   有一位是符号： 2*15  = ~32768 - 32768  00~FF 256
    const newBuffer = new Int16Array(buffer)
    // 将buffer分成20份，每一份就是一个柱子的buffer的大小
    const sampleSize = Math.floor(newBuffer.length / 20)
    // 计算每块振幅的大小，放进数组中
    const amplitudes: number[] = []
    // sampleSize是i的递增步长，循环每一块buffer
    for (let i = 0; i < newBuffer.length; i += sampleSize) {
      let sum = 0
      for (let j = i; j < i + sampleSize; j++) {
        const sample = newBuffer[j]
        sum += Math.abs(sample)
      }
      const average = sum / sampleSize / 32767 * 100 // 0 ~ 1
      amplitudes.push(average < 10 ? 10 : average)
    }
    animateTo({duration:100},()=>{
      this.list = amplitudes
    })
  }

  aboutToAppear(): void {
    emitter.on('calcVoice', (data) => {
      this.calcVoice(data.data!.buffer as ArrayBuffer)
    })
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        this.getDisplayContent()
      }.height('100%')
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(this.voiceState === VoiceRecordEnum.Cancel ? HorizontalAlign.Start : HorizontalAlign.Center)

      Column() {
        // 显示关闭和文本
        Row() {
          Row() {
            Image($r("app.media.ic_public_cancel"))
              .width(30)
              .height(30)
              .fillColor(this.voiceState === VoiceRecordEnum.Cancel ? $r("app.color.text_primary") : $r("app.color.voice_round_font_color"))
          }
          .width(70)
          .aspectRatio(1)
          .borderRadius(35)
          .justifyContent(FlexAlign.Center)
          .backgroundColor(this.voiceState === VoiceRecordEnum.Cancel ? $r("app.color.bottom_color") : $r("app.color.voice_round_color"))
          .rotate({
            angle: -10
          })
          .scale({
            x: this.voiceState === VoiceRecordEnum.Cancel ? 1.2 : 1,
            y: this.voiceState === VoiceRecordEnum.Cancel ? 1.2 : 1
          })

          Row() {
            Text("文")
              .fontSize(24)
              .textAlign(TextAlign.Center)
              .fontColor(this.voiceState === VoiceRecordEnum.Transfer ? $r("app.color.text_primary") : $r("app.color.voice_round_font_color"))
          }
          .width(70)
          .aspectRatio(1)
          .borderRadius(35)
          .justifyContent(FlexAlign.Center)
          .backgroundColor(this.voiceState === VoiceRecordEnum.Transfer ? $r("app.color.bottom_color") : $r("app.color.voice_round_color"))
          .rotate({
            angle: 10
          })
          .scale({
            x: this.voiceState === VoiceRecordEnum.Transfer ? 1.2 : 1,
            y: this.voiceState === VoiceRecordEnum.Transfer ? 1.2 : 1
          })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({
          left: 40,
          right: 40
        })
        .margin({
          bottom: 30
        })

        Stack() {
          Image($r("app.media.ic_public_output"))
            .width('100%')
            .height(120)
            .fillColor(this.voiceState === VoiceRecordEnum.Recording ? $r("app.color.bottom_color") : $r('app.color.voice_round_color'))
            .scale({
              x: this.voiceState === VoiceRecordEnum.Recording ? 1.2 : 1
            })
          Image($r("app.media.ic_public_recorder"))
            .width(30)
            .height(30)
            .fillColor(this.voiceState === VoiceRecordEnum.Recording ? $r("app.color.bottom_voice_color") : $r('app.color.bottom_color'))
        }
        .width('100%')
      }
    }
    .height('100%')
    .backgroundColor($r("app.color.voice_back_color"))

  }
}

export default VoiceInput