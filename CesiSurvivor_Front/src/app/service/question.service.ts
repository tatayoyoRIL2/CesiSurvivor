import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { IQuestion } from '../models/question.model';

export interface IQuestionRequest {
    IDQuestion: number;
    label: string;
    answerList: string;
}

@Injectable({
    providedIn: 'root'
})
export class QuestionService {
    constructor(private http: HttpClient) { }

    public getQuestion(): Observable<IQuestion[]> {
        return this.http.get<IQuestion[]>(environment.question);
    }

    public getQuestionById(idQuestion: number): Observable<IQuestionRequest[]> {
        return this.http.get<IQuestionRequest[]>(`${environment.question}/${idQuestion}`);
    }

    public createQuestion(question: IQuestion): Observable<IQuestion> {
        return this.http.post<IQuestion>(environment.question, { ...question });
    }
}
