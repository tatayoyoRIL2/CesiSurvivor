import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { SharedModule } from '../shared/shared.module';
import { InitGameComponent } from './init-game/init-game.component';
import { StoryFormComponent } from './story-form/story-form.component';
import { StoryComponent } from './story/story.component';

@NgModule({
    declarations: [
        InitGameComponent,
        StoryComponent,
        StoryFormComponent
    ],
    imports: [
        CommonModule,
        SharedModule,
        HttpClientModule
    ],
    exports: [
        InitGameComponent,
        StoryComponent,
        StoryFormComponent
    ]
})
export class ComponentModule { }
