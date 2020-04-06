import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
import { IScore } from '../models/score.model';

@Injectable({
    providedIn: 'root'
})
export class ScoreService {

    constructor(private http: HttpClient) { }

    public getScore(): Observable<IScore[]> {
        return this.http.get<IScore[]>(environment.score);
    }

    public createScore(score: IScore): Observable<IScore> {
        return this.http.post<IScore>(environment.score, { ...score });
    }
}
