export class VocabModel {
  id: number;
  word: string;
  meaning: string;

  constructor(
    id: number = 0,
    word: string = '',
    meaning: string = ''
  ) {
    this.id = id;
    this.word = word;
    this.meaning = meaning;
  }
}