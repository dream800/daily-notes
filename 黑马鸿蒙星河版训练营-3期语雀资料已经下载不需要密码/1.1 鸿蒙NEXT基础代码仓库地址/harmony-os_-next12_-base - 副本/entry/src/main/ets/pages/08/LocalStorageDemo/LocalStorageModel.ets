// 一个数据是对象可以用i2c，但是不确定有多少个属性，用Record
// const self:Record<string,Resource | string> = {
const self: Record<string, ResourceStr> = {
  'avtar': $r('app.media.b'),
  'nickName': '一介码农',
  'gender': '男',
  'age': '18'
}
//1.new LocalStorage(数据)
export const localUserInfo = new LocalStorage(self)

// export const setLocalData = (key:string,val:string)=>{
//     localUserInfo.setOrCreate(key,val)
// }

//改成对象的方案：
//1.i2c

// class xxx {
//
// }

// const self: Record<string, xxx> = {
//   'avtar': new xxx(),
// }

// 2.Record<string,Record<string,string>>