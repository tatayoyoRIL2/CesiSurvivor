import { IReponse } from './reponse.model';

export interface IQuestion {
    IDQuestion?: number;
    label: string;
    answerList: IReponse[];
}
