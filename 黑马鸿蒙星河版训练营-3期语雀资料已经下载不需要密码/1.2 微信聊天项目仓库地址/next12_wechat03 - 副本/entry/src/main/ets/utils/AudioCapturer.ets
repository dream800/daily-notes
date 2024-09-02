import { audio } from '@kit.AudioKit'
import { fileIo } from '@kit.CoreFileKit'
import { emitter } from '@kit.BasicServicesKit'

export class AudioCapturer {
  // 录音笔
  static audioCapturer: audio.AudioCapturer
  //   streamInfo
  static audioStreamInfo: audio.AudioStreamInfo = {
    samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
    channels: audio.AudioChannel.CHANNEL_1,
    sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
    encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
  }
  //   capturerInfo
  static audioCapturerInfo: audio.AudioCapturerInfo = {
    source: audio.SourceType.SOURCE_TYPE_MIC,
    capturerFlags: 0
  }
  // 当前是否进行录制
  static recordIng: boolean = false

  static async init() {
    // 创建一个可以用于录音的capturer
    AudioCapturer.audioCapturer = await audio.createAudioCapturer({
      streamInfo: AudioCapturer.audioStreamInfo,
      capturerInfo: AudioCapturer.audioCapturerInfo
    })
  }

  // 开始录制：长摁手势
  static async start(filePath: string) {
    try {
      //1.从麦克风收集数据  ->  2.写入音频文件
      let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE)
      let fd = file.fd
      let bufferSize = fileIo.statSync(fd).size
      AudioCapturer.recordIng = true
      // 开启录音笔
      await AudioCapturer.audioCapturer.start()
      // 收集数据的条件
      while (AudioCapturer.recordIng) {
        // capturer录制的内容会写入缓冲区，size就是缓冲区内容的大小
        let size = AudioCapturer.audioCapturer.getBufferSizeSync()
        let buffer = await AudioCapturer.audioCapturer.read(size, true)
        if (buffer) {
          fileIo.writeSync(fd, buffer, {
            offset: bufferSize,
            length: buffer.byteLength
          })
          // 通知页面进行展示
          emitter.emit('calcVoice',{
              data:{
                buffer
              }
          })
          bufferSize += buffer.byteLength
        }
      }
    } catch (error) {
      AlertDialog.show({
        message: JSON.stringify('当前暂不支持录音')
      })
    }
  }

  // 结束录制：抬起长摁
  static stop() {
    if(AudioCapturer.audioCapturer){
      //  结束录音
      AudioCapturer.recordIng = false
      // 关闭录音笔
      AudioCapturer.audioCapturer.stop()
    }

  }
  // 释放资源
  static async release(){
    if(AudioCapturer.audioCapturer){
      await AudioCapturer.audioCapturer.release()
    }

  }
}
