import { IReponse } from './reponse.model';

export interface IQuestion {
    id: number;
    label: string;
    reponses: IReponse[];
}
