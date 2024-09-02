@Preview
@Component
struct HmLoading {
  @State
  value: number = 0
  timer: number = -1

  // 1.进入这个页面的aboutToAppear
  aboutToAppear(): void {
    // 2.setInterval开启定时器，会返回一个定时器标志，拿这个标志才能关闭
    this.timer = setInterval(() => {
      this.value++
      if (this.value === 100) {
        this.value = 0
      }
    }, 10)
  }

  // 3.页面挂掉的时候
  aboutToDisappear(): void {
    // 关闭定时器
    clearInterval(this.timer)
  }

  build() {
    Progress({
      type: ProgressType.Ring,
      total: 100,
      value: this.value
    })
  }
}

export default HmLoading