import { http } from '@kit.NetworkKit'
import { ChatData, ChatResponse } from '../models/chat'

const req = http.createHttp()

export async function requestMessage(content: string) {
  try{
    const res = await req.request('https://api.ownthink.com/bot?appid=xiaosi&userid=user&spoken=' + content)
    const result = JSON.parse(res.result as string) as ChatResponse
    return result
  }catch(error){
    return Promise.reject(error)
  }
}