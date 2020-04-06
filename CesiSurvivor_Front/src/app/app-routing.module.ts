import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InitGameComponent } from './component/init-game/init-game.component';


const routes: Routes = [
    { path: '', component: InitGameComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
 }
