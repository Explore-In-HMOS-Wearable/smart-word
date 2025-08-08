import { ArcSwiper, ArcSwiperAttribute } from '@kit.ArkUI'
import { StorageManager } from '../model/StorageManager';
import { VocabModel } from '../model/VocabModel';
import { common } from '@kit.AbilityKit';
import { RouterUtil } from '../utils/RouterUtil';
import { NotificationService } from '../service/NotificationService';
import {
  DAY_IDX_KEY,
  DAY_IDX_OLD_KEY,
  ENABLED_DAY_OLD_URL,
  ENABLED_DAY_URL,
  IS_SEND_NOTIF_KEY,
  NOTIFICATION_URL
} from '../utils/Constants';

@Entry
@Component
struct WordsPage {
  private storageManager: StorageManager = new StorageManager()
  @State vocabList: VocabModel[] = []
  @State isBlur: boolean = true
  @State flagIdx: number = 0
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;

  aboutToAppear(): void {
    this.vocabList = RouterUtil.getParams() as VocabModel[]
  }

  build() {
    Stack() {
      ArcSwiper() {
        ForEach(this.vocabList, (vocab: VocabModel, index: number) => {
          Column() {
            Text(vocab.word)
            Text(vocab.meaning)
              .fontSize(20)
              .fontColor(Color.White)
              .margin(8)
              .padding(10)
              .borderRadius(35)
              .foregroundBlurStyle((this.isBlur == true) ? BlurStyle.Thick : BlurStyle.NONE, {
                colorMode: ThemeColorMode.LIGHT,
                adaptiveColor: AdaptiveColor.DEFAULT,
                scale: 0.1
              })
              .onClick(() => {
                this.isBlur = !this.isBlur
              })
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
        }, (item: string, index: number) => item)

        Column() {
          Text($r('app.string.do_you_ready'))
          Button($r('app.string.no_continue'))
            .onClick(async () => {
              NotificationService.triggerSimpleNotification()
              RouterUtil.back()
            })
            .margin({ top: 8 })
          Button($r('app.string.next_day'))
            .onClick(async () => {
              let dayIdx =
                await this.storageManager.getStorageValue(this.context, DAY_IDX_KEY, ENABLED_DAY_URL) as number;
              if (!dayIdx) {
                dayIdx = 0
              }
              await this.storageManager.putStorageValue(this.context, DAY_IDX_KEY, dayIdx + 1, ENABLED_DAY_URL);
              await this.storageManager.putStorageValue(this.context, DAY_IDX_OLD_KEY, dayIdx, ENABLED_DAY_OLD_URL);
              await this.storageManager.putStorageValueBoolean(this.context, IS_SEND_NOTIF_KEY, false,
                NOTIFICATION_URL);

              RouterUtil.back()
            })
            .margin({ top: 6 })

        }.width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)

      }.width('100%')
      .height('100%')
      .onGestureSwipe(() => {
        this.isBlur = true
      })

      Image($r('app.media.back'))
        .width(30)
        .height(30)
        .margin({ top: 10 })
        .onClick(() => {
          RouterUtil.back()
        })
    }.alignContent(Alignment.Top)
    .width('100%')
    .height('100%')
  }
}