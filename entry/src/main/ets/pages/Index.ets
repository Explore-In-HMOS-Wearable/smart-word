import { NavigationService } from '../service/NavigationService';
import { HomePage } from './HomePage';
import { WordsPage } from './WordsPage';

@Entry
@Component
struct Index {

  navigationService: NavigationService = NavigationService.getInstance();

  @Builder
  routeMap(name: string) {
    NavDestination() {
      if (name === 'HomePage') {
        HomePage()
      } else if (name === 'WordsPage') {
        WordsPage();
      }
    }
    .onBackPressed( ()=>true )
    .hideTitleBar(true)
  }

  build() {
    Navigation(this.navigationService.pageInfos) {
      Column() {
        Text($r('app.string.smart_word'))
          .fontSize(24)
        Image($r('app.media.scrabble'))
          .width(100)
          .height(100)
          .onClick(()=>{
            this.navigationService.pageInfos.pushPath({ name: 'HomePage' })
          })
      }.width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .mode(NavigationMode.Stack)
    .navDestination(this.routeMap)
    .ignoreLayoutSafeArea()
    .hideTitleBar(true)
    .width('100%')
    .height('100%')
  }
}