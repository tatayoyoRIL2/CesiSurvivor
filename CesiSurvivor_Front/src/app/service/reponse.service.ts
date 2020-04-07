import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { IReponse } from './../models/reponse.model';

@Injectable({
    providedIn: 'root'
})
export class ReponseService {
    constructor(private http: HttpClient) { }

    public getReponse(): Observable<IReponse[]> {
        return this.http.get<IReponse[]>(environment.reponse);
    }

    public getReponseById(idReponse: number | string): Observable<IReponse> {
        return this.http.get<IReponse>(`${environment.reponse}/${idReponse}`);
    }

    public CreateReponse(reponse: IReponse): Observable<IReponse> {
        return this.http.post<IReponse>(environment.reponse, { ...reponse });
    }
}
