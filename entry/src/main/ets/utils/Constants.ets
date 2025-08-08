import { VocabModel } from '../model/VocabModel';
import { DayModel } from '../model/DayModel';

export const dayData: DayModel[] = [
  new DayModel(1, 'Day 1', [
    new VocabModel(1, 'Neglect', 'İhmal etmek'),
    new VocabModel(2, 'Reluctant', 'Gönülsüz'),
    new VocabModel(3, 'Thorough', 'Ayrıntılı, eksiksiz'),
    new VocabModel(4, 'Anticipate', 'Beklemek, öngörmek'),
    new VocabModel(5, 'Benevolent', 'İyiliksever'),
  ]),
  new DayModel(2, 'Day 2', [
    new VocabModel(6, 'Plausible', 'Mantıklı, akla yatkın'),
    new VocabModel(7, 'Ambiguous', 'Belirsiz, iki anlamlı'),
    new VocabModel(8, 'Conceal', 'Gizlemek'),
    new VocabModel(9, 'Deteriorate', 'Kötüleşmek, bozulmak'),
    new VocabModel(10, 'Imminent', 'Yaklaşan, eli kulağında'),
  ]),
  new DayModel(3, 'Day 3', [
    new VocabModel(11, 'Disrupt', 'Aksatmak, bozmak'),
    new VocabModel(12, 'Feasible', 'Yapılabilir, mümkün'),
    new VocabModel(13, 'Indifferent', 'Kaygısız, ilgisiz'),
    new VocabModel(14, 'Foster', 'Teşvik etmek, büyütmek'),
    new VocabModel(15, 'Cite', 'Alıntı yapmak'),
  ]),
  new DayModel(4, 'Day 4', [
    new VocabModel(16, 'Impede', 'Engellemek'),
    new VocabModel(17, 'Incentive', 'Teşvik'),
    new VocabModel(18, 'Valid', 'Geçerli'),
    new VocabModel(19, 'Cohesive', 'Uyumlu, yapışık'),
    new VocabModel(20, 'Resilient', 'Dayanıklı, dirençli'),
  ]),
  new DayModel(5, 'Day 5', [
    new VocabModel(21, 'Sparse', 'Seyrek'),
    new VocabModel(22, 'Intact', 'Sağlam, bozulmamış'),
    new VocabModel(23, 'Legitimate', 'Yasal, meşru'),
    new VocabModel(24, 'Substantial', 'Önemli, büyük'),
    new VocabModel(25, 'Controversy', 'Tartışma, ihtilaf'),
  ]),
];

export const DAY_IDX_KEY: string = 'dayIdx'
export const ENABLED_DAY_URL: string = 'enabledDay'
export const DAY_IDX_OLD_KEY: string = 'dayIdxOld'
export const ENABLED_DAY_OLD_URL: string = 'enabledDayOld'
export const IS_SEND_NOTIF_KEY: string = 'isSendNotif'
export const NOTIFICATION_URL: string = 'notification'