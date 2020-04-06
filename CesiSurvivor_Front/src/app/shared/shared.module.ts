import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { FlexLayoutModule } from '@angular/flex-layout';
import { ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { NgZorroAntdModule } from 'ng-zorro-antd';

@NgModule({
    imports: [
        CommonModule,
        NgZorroAntdModule,
        CommonModule,
        ReactiveFormsModule,
        FlexLayoutModule,
        RouterModule
    ],
    exports: [
        CommonModule,
        NgZorroAntdModule,
        CommonModule,
        ReactiveFormsModule,
        RouterModule
    ]
})
export class SharedModule { }
