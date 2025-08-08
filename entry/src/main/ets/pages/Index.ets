import { RouterUtil } from '../utils/RouterUtil'

@Entry
@Component
struct Index {
  build() {
    Column() {
      Text($r('app.string.smart_word'))
        .fontSize(24)
      Image($r('app.media.scrabble'))
        .width(100)
        .height(100)
        .onClick(()=>{
          RouterUtil.navigateToHome()
        })
    }.width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}