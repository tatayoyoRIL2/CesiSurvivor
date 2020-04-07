import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { IUser } from 'src/app/models/user.model';
import { environment } from 'src/environments/environment';

@Injectable({
    providedIn: 'root'
})
export class UserService {

    constructor(private http: HttpClient) { }

    public getUser(): Observable<IUser[]> {
        return this.http.get<IUser[]>(environment.user);
    }

    public createUser(user: IUser): Observable<IUser> {
        return this.http.post<IUser>(environment.user, user);
    }
}
