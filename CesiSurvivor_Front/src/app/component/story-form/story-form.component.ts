import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { IQuestion } from 'src/app/models/question.model';
import { ReponseService } from 'src/app/service/reponse.service';
import { QuestionService } from './../../service/question.service';

@Component({
    selector: 'app-story-form',
    templateUrl: './story-form.component.html',
    styleUrls: ['./story-form.component.css']
})
export class StoryFormComponent implements OnDestroy, OnInit {
    destroy: Subject<void> = new Subject();

    question: IQuestion = {
        label: '',
        answerList: []
    };

    constructor(
        private questionService: QuestionService,
        private reponseService: ReponseService
    ) { }

    ngOnDestroy(): void {
        this.destroy.next();
        this.destroy.complete();
    }

    ngOnInit() {
        this.goToQuestion(1);
    }

    public goToQuestion(idQuestion: number): void {
        this.questionService
            .getQuestionById(idQuestion)
            .pipe(takeUntil(this.destroy))
            .subscribe(q => {
                this.question = {
                    IDQuestion: q[0].IDQuestion,
                    label: q[0].label,
                    answerList: []
                };


                JSON.parse(q[0].answerList).forEach(
                    repId => this.reponseService
                        .getReponseById(repId)
                        .pipe(takeUntil(this.destroy))
                        .subscribe(rep => {
                            this.question.answerList = [...this.question.answerList, rep[0]];
                        }
                        ));

            });
    }
}
