import { VocabModel } from './VocabModel';

export class DayModel {
  id: number;
  label: string;
  vocabList: VocabModel[];

  constructor(
    id: number = 0,
    label: string = '',
    vocabList: VocabModel[] = []
  ) {
    this.id = id;
    this.label = label;
    this.vocabList = vocabList;
  }
}