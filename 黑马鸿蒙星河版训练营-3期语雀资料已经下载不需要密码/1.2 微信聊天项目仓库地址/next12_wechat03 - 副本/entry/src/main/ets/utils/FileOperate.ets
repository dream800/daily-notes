import { fileIo } from '@kit.CoreFileKit'

export class FileOperate {
  // 创建文件，返回文件路径
  static createAudioFile(userId: string) {
    // 判断该用户有无文件夹
    // 文件操作基本都是页面产生的，所以可以直接获取上下文
    let dirPath = getContext().filesDir + '/' + userId
    let flag = fileIo.accessSync(dirPath)
    if (!flag) {
      // 如果没有文件夹，先创建文件夹
      fileIo.mkdirSync(dirPath)
    }
    let filePath = dirPath+'/'+Date.now()+'.wav'
    const file = fileIo.openSync(filePath,fileIo.OpenMode.CREATE)
    fileIo.closeSync(file)
    return filePath
  }
  // 删除文件
  static delFilePath(filePath:string){
    if(filePath){
      fileIo.unlinkSync(filePath)
    }
  }
  // 删除目录
  static delUserPath(userId:string){
    if(userId){
      let dirPath = getContext().filesDir+'/'+userId
      let flag = fileIo.accessSync(dirPath)
      if(flag){
        fileIo.rmdirSync(dirPath)
      }
    }
  }
}