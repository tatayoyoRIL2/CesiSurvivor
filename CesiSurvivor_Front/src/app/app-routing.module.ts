import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InitGameComponent } from './component/init-game/init-game.component';
import { StoryComponent } from './component/story/story.component';


const routes: Routes = [
    { path: '', component: InitGameComponent },
    { path: 'story', component: StoryComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
 }
