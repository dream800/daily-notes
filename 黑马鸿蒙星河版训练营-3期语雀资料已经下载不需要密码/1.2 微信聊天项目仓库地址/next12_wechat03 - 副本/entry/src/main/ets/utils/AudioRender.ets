import { audio } from '@kit.AudioKit'
import { fileIo } from '@kit.CoreFileKit'

export class AudioRender {
  // 播放器
  static renderModel: audio.AudioRenderer
  // streamInfo
  static audioStreamInfo: audio.AudioStreamInfo = {
    samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
    channels: audio.AudioChannel.CHANNEL_1,
    sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
    encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
  }
  // renderInfo
  static audioRenderInfo: audio.AudioRendererInfo = {
    rendererFlags: 0,
    usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT
  }
  static audioRenderOptions: audio.AudioRendererOptions = {
    streamInfo: AudioRender.audioStreamInfo,
    rendererInfo: AudioRender.audioRenderInfo
  }
  // 要进行播放的文件
  static renderFile: fileIo.File
  // 播放的文件的大小
  static maxSize: number = 0
  // 已经播放的大小
  static renderSize: number = 0
  // 结束的回调函数
  static callBack: () => void

  static async init() {
    // 创建播放器
    AudioRender.renderModel = await audio.createAudioRenderer(AudioRender.audioRenderOptions)
    // 监听播放过程
    AudioRender.renderModel.on('writeData', (buffer: ArrayBuffer) => {
      if (AudioRender.renderFile) {
        //之所以有声音：通过读文件产生的
        fileIo.readSync(AudioRender.renderFile.fd, buffer, {
          offset: AudioRender.renderSize,
          length: buffer.byteLength
        })
        // 更新已经渲染的尺寸
        AudioRender.renderSize += buffer.byteLength
      }
      // 自己判断是否结束
      if (AudioRender.renderSize >= AudioRender.maxSize) {
        // 读文件停止
        fileIo.closeSync(AudioRender.renderFile.fd)
        // 播放器停
        AudioRender.stop()
      }
    })
  }

  // 播放
  static async start(filePath: string, callback1?: () => void, callback2?: () => void) {
    // 每次播放前必须清空上一次！
    await AudioRender.stop()
    // 要播放的文件
    AudioRender.renderFile = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE)
    // 通过文件获取最大size
    AudioRender.maxSize = fileIo.statSync(AudioRender.renderFile.fd).size
    callback1 && callback1()
    if (callback2) {
      AudioRender.callBack = callback2
    }
    // 开始播放
    AudioRender.renderModel.start()
  }

  // 停止
  static async stop() {
    // 遵守状态机：只有running才能stop
    if (AudioRender.renderModel && AudioRender.renderModel.state === audio.AudioState.STATE_RUNNING) {
      await AudioRender.renderModel.stop()
      AudioRender.callBack && AudioRender.callBack()
      AudioRender.maxSize = 0
      AudioRender.renderSize = 0
    }

  }
}