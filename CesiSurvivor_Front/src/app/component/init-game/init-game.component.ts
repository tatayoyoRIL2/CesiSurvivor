import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NzMessageService } from 'ng-zorro-antd';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { UserService } from 'src/app/service/user.service';
import { IUser } from './../../models/user.model';


@Component({
    selector: 'app-init-game',
    templateUrl: './init-game.component.html',
    styleUrls: ['./init-game.component.css']
})
export class InitGameComponent implements OnDestroy, OnInit {
    users: IUser[] = [];

    data: any;

    private destroy: Subject<void> = new Subject();

    constructor(
        private messageService: NzMessageService,
        private userService: UserService,
        private router: Router
    ) { }


    ngOnDestroy(): void {
        this.destroy.next();
        this.destroy.complete();
    }

    ngOnInit() {
    }

    submit(name: string): void {
        if (name.trim() === '') {
            this.messageService.create('error', 'Le pseudo doit contenir des caractères.');
            return;
        }

        this.userService
            .createUser({ username: name })
            .pipe(takeUntil(this.destroy))
            .subscribe(() => this.router.navigate(['/', 'story']));
    }
}
