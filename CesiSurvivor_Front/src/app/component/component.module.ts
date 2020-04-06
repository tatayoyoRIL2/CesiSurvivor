import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { SharedModule } from '../shared/shared.module';
import { InitGameComponent } from './init-game/init-game.component';

@NgModule({
    declarations: [InitGameComponent],
    imports: [CommonModule, SharedModule, HttpClientModule],
    exports: [InitGameComponent]
})
export class ComponentModule { }
