import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NzMessageService } from 'ng-zorro-antd';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { IUser } from 'src/app/models/user.model';
import { UserService } from 'src/app/service/user.service';


@Component({
    selector: 'app-init-game',
    templateUrl: './init-game.component.html',
    styleUrls: ['./init-game.component.css']
})
export class InitGameComponent implements OnInit {
    users: IUser[] = [];

    data: any;
    private destroy: Subject<void> = new Subject();

    constructor(
        private messageService: NzMessageService,
        private userService: UserService,
        private http: HttpClient
    ) { }

    ngOnInit() {
        this.userService
            .getUser()
            .pipe(takeUntil(this.destroy))
            .subscribe(users => {
                console.log('USERS : ', users);
                this.users = users;
            });
    }

    submit(name: string): void {
        if (name.trim() === '') {
            this.messageService.create('error', 'Le pseudo doit contenir des caractères.');
            return;
        }

        // Post le pseudo
        // Get Question 1
    }

}
