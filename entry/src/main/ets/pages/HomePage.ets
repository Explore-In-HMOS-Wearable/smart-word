import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute } from '@kit.ArkUI'
import { StorageManager } from '../model/StorageManager';
import { common } from '@kit.AbilityKit';
import { MainViewModel } from '../viewmodel/MainViewModel';
import { DayModel } from '../model/DayModel';
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
struct HomePage {
  private storageManager: StorageManager = new StorageManager()
  private viewModel: MainViewModel = new MainViewModel();
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  @State vocabList: DayModel[] = this.viewModel.getVocabData()
  @State enabledIndex: number = 0

  async onPageShow(): Promise<void> {
    let enabledIndexFromStorage =
      await this.storageManager.getStorageValue(this.context, DAY_IDX_KEY, ENABLED_DAY_URL) as number;
    let enabledIndexOld =
      await this.storageManager.getStorageValue(this.context, DAY_IDX_OLD_KEY, ENABLED_DAY_OLD_URL) as number;
    let isSendNotif =
      await this.storageManager.getStorageValue(this.context, IS_SEND_NOTIF_KEY, NOTIFICATION_URL) as boolean;

    if (!isSendNotif) {
      NotificationService.triggerNotificationWithAgent()
      await this.storageManager.putStorageValueBoolean(this.context, IS_SEND_NOTIF_KEY, true, NOTIFICATION_URL);
    }

    if (enabledIndexFromStorage) {
      this.enabledIndex = enabledIndexFromStorage
    }
  }

  build() {
    ArcList({
      initialIndex: 1
    }) {
      ArcListItem() {
        Text($r('app.string.great_day'))
          .fontSize(20)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {

          })
      }
      .margin({ bottom: 16 })

      ForEach(this.vocabList, (vocabDay: DayModel, index: number) => {
        ArcListItem() {
          Row() {
            Text(vocabDay.label)
          }
          .backgroundColor((this.enabledIndex >= index) ? $r('app.color.enabled_day_background') : $r('app.color.disabled_day_background'))
          .width('90%')
          .height('90px')
          .justifyContent(FlexAlign.Center)
          .borderRadius(48)
          .padding(10)
          .enabled((this.enabledIndex >= index) ? true : false)
          .onClick(() => {
            RouterUtil.navigateToWordsPage(vocabDay.vocabList)
          })
        }
        .width('100%')
        .margin({ bottom: 8 })

      }, (word: string) => word)
    }
    .height('100%')
    .width('100%')
    .scrollBar(BarState.Off)
    .enableScrollInteraction(true)
    .fadingEdge(false)
  }
}