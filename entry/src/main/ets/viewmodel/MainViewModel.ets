import { DayModel } from '../model/DayModel';
import { dayData } from '../utils/Constants';

export class MainViewModel {

  getVocabData(): DayModel[] {
    return dayData;
  }
}