import { IScore } from './score.model';

export interface IUser {
    id?: number;
    username: string;
    scores?: IScore[];
}
