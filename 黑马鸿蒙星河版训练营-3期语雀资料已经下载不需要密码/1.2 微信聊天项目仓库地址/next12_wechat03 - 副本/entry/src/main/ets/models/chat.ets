export interface ChatResponse{
    message:string
    data:ChatData
}

export interface ChatData {
  type:number
  info:ChatInfo
}

export interface ChatInfo {
   text:string
}