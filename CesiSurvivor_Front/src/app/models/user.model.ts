import { IScore } from './score.model';

export interface IUser {
    id: number;
    name: string;
    scores: IScore[];
}
