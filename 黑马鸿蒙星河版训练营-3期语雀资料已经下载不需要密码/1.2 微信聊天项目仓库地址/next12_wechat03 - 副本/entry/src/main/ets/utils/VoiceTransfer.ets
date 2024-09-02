import { speechRecognizer, textToSpeech } from '@kit.CoreSpeechKit'
import { util } from '@kit.ArkTS'
import { fileIo } from '@kit.CoreFileKit'

export class VoiceTransfer {
  // asrEngine 引擎 语音转文字
  static asrEngine: speechRecognizer.SpeechRecognitionEngine
  // 引擎创建参数
  static textInitParams: speechRecognizer.CreateEngineParams = {
    // 识别为什么语音
    language: 'zh-CN',
    online: 1,
    extraParams: {
      "locate": "CN",
      "recognizerMode": "short"
    }
  }

  // 创建引擎
  static async voiceToText(path: string, call: (result: speechRecognizer.SpeechRecognitionResult) => void) {
    //1.创建引擎
    if (!VoiceTransfer.asrEngine) {
      VoiceTransfer.asrEngine = await speechRecognizer.createEngine(VoiceTransfer.textInitParams)
    }
    //2.判断当前是否引擎在转换
    if (VoiceTransfer.asrEngine.isBusy()) return
    //3.可以进行语音转换 (3.1准备语音转换状态监听参数 3.2开启监听)
    // 3.1准备语音转换状态监听参数
    let setListener: speechRecognizer.RecognitionListener = {
      onStart() {
      },
      onEvent() {
      },
      onResult(sessionId: string, result: speechRecognizer.SpeechRecognitionResult) {
        console.log('resultStr', result.result)
        call(result)
        if (result.isLast) {
          // 结束转换
          VoiceTransfer.asrEngine.finish(sessionId)
        }
      },
      onComplete() {
      },
      onError() {
      }
    }
    // 3.2开启监听
    VoiceTransfer.asrEngine.setListener(setListener)
    // 3.3准备启动引擎参数
    // 启动引擎参数
    const startParams: speechRecognizer.StartParams = {
      sessionId: util.generateRandomUUID(),
      audioInfo: {
        audioType: 'pcm',
        sampleRate: 16000,
        soundChannel: 1,
        sampleBit: 16
      },
      extraParams: {
        "vadBegin": 2000,
        "vadEnd": 3000,
        "maxAudioDuration": 60000
      }
    }
    // 3.4启动转换
    VoiceTransfer.asrEngine.startListening(startParams)
    // 3.5给引擎传递要转换的内容(缓冲区)
    VoiceTransfer.writeAudio(path, startParams.sessionId)
  }

  // 将音频写入引擎的缓冲区开始进行转化
  static async writeAudio(path: string, sessionId: string) {
    // 3.5.1读文件(读传递过来的音频)
    let file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE)
    // 定义每次读取文件的缓冲区
    let buf: ArrayBuffer = new ArrayBuffer(1280)
    // 代表已经读取的文件大小
    let totalSize: number = 0
    // 3.5.2读一部分音频，传递给引擎的缓冲区
    while (totalSize < fileIo.statSync(file.fd).size) {
      fileIo.readSync(file.fd, buf, {
        offset: totalSize,
        length: 1280
      })
      // uint8Array可以进行文字转换的buffer
      let uint8Array: Uint8Array = new Uint8Array(buf)
      // 3.5.3-----监听实现的，引擎缓冲区监听到内容后进行转化，返回结果
      VoiceTransfer.asrEngine.writeAudio(sessionId, uint8Array)
      // 必须要等待
      await new Promise<boolean>((resolve) => {
        setTimeout(() => {
          return resolve(true)
        }, 30)
      })
      totalSize += 1280
    }
    // 3.5.4读完文件了，关闭读取文件，关闭缓冲区写入
    fileIo.closeSync(file)
    VoiceTransfer.asrEngine.finish(sessionId)
  }


  // ttsEngine 文字转语音
  static ttsEngine:textToSpeech.TextToSpeechEngine
  // 引擎创建参数
  static voiceInitParams:textToSpeech.CreateEngineParams = {
    language: 'zh-CN',
    person: 0,
    online: 1,
    extraParams: {
      "style": 'interaction-broadcast',
      "locate": 'CN',
      "name": 'EngineName'
    }
  }
  static speakParams: textToSpeech.SpeakParams = {
    requestId: util.generateRandomUUID(),
    extraParams: {
      "speed": 2,
      "volume": 1,
      "pitch": 1,
      "languageContext": 'zh-CN',
      "audioType": "pcm"
    }
  }
  static async textToVoice(text:string){
    if(!VoiceTransfer.ttsEngine){
      VoiceTransfer.ttsEngine = await textToSpeech.createEngine(VoiceTransfer.voiceInitParams)
    }
    VoiceTransfer.ttsEngine.speak(text,VoiceTransfer.speakParams)
  }
}