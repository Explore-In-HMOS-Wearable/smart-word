import { Router } from '@ohos.arkui.UIContext';
import { VocabModel } from '../model/VocabModel';

export class RouterUtil {
  static _router: Router = new Router()

  static navigateToHome() {
    RouterUtil._router.pushUrl({ url: 'pages/HomePage' });
  }

  static navigateToWordsPage(vocabList: VocabModel[]) {
    RouterUtil._router.pushUrl({
      url: 'pages/WordsPage',
      params: vocabList
    })
  }

  static back() {
    RouterUtil._router.back();
  }

  static getParams() {
    return RouterUtil._router.getParams();
  }
}
