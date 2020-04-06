import { IUser } from './user.model';

export interface IScore {
    id: number;
    score: number;
    user: IUser;
}
