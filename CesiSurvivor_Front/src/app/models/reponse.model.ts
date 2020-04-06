import { IQuestion } from './question.model';

export interface IReponse {
    id: number;
    label: string;
    image: string;
    question: IQuestion;
}
