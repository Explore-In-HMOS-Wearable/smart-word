@ObservedV2
export class NavigationService {
  static _instance: NavigationService;
  @Trace pageInfos: NavPathStack = new NavPathStack()
  @Trace pageList: PageModel[] = [];

  static getInstance() {
    if (!NavigationService._instance) {
      NavigationService._instance = new NavigationService();
    }

    return NavigationService._instance;
  }
}

export class PageModel {
  page: () => void;
  pageRoute: string = '';

  constructor(page: () => void, pageRoute: string) {
    this.page = page;
    this.pageRoute = pageRoute;
  }
}