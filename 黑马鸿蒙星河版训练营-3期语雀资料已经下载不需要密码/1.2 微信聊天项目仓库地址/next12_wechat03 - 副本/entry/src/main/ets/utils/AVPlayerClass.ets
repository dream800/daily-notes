import { media } from '@kit.MediaKit'

export class AVPlayerClass {
  //播放器
  static player: media.AVPlayer
  static context: Context

  //初始化:
  static async init(context: Context) {
    // 1.创建播放器:状态->idle
    AVPlayerClass.player = await media.createAVPlayer()
    AVPlayerClass.context = context
    // 3.检测状态
    AVPlayerClass.player.on('stateChange', async (state) => {
      if (state === 'initialized') {
        // 状态:prepared
        AVPlayerClass.player.prepare()
      } else if (state === 'prepared') {
        // 状态:playing
        AVPlayerClass.player.play()
      } else if (state === 'completed') {
        //   播放完成：
        await AVPlayerClass.player.reset()
      }
    })
    AVPlayerClass.player.on('durationUpdate', (duration) => {
      //  duration是 当前设置资源的时长
    })
    AVPlayerClass.player.on('timeUpdate', (time) => {
      //  time是 当前播放的时长（高频率更新）
    })
    AVPlayerClass.player.on('seekDone', (seekTime) => {
      //   监听切换播放进度事件
      //   seekTime是要切换的时长
    })

  }
  // 2.设置音频源
  static async play(type: 'camera' | 'information' | 'send') {
    // 只有idle才能设置src -> idle
    await AVPlayerClass.player.reset()
    // 在线文件播放：
    // AVPlayerClass.player.url = 'https://m804.music.126.net/20240605194838/cb0df5c12374e576e7a8b1b3352f1679/jdyyaac/obj/w5rDlsOJwrLDjj7CmsOj/7259260757/955f/81fe/bd0f/3d71ae535cbc6e99a91099f1104e80f3.m4a?authSecret=0000018fe823e89c1c000aaba04a67a4'
    // 本地文件播放：
    // 状态：initialized
    let fileDescriptor = AVPlayerClass.context.resourceManager.getRawFdSync(type + '.wav')
    AVPlayerClass.player.fdSrc = fileDescriptor
  }
  // 方法控制：
  // 切换播放进度
  // AVPlayerClass.player.seek(0)
  // 暂停
  // AVPlayerClass.player.pause()
  // 播放
  // AVPlayerClass.player.play()
  // 停止
  // AVPlayerClass.player.stop()
  // 循环播放
  // AVPlayerClass.player.loop = true
}