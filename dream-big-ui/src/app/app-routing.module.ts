import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { CategoryComponent } from './admin/category.component';
import { StarControlComponent } from './Components/StarControl/star-control.component';
import { UserListComponent } from './admin/user-list/user-list.component';

const unitsModule = () => import('./admin/units/units.module').then(x => x.UnitsModule);


const routes: Routes = [
  {path:'categorys', component: CategoryComponent},
  {path:'users', component: UserListComponent},
  {path:'star', component: StarControlComponent },
  {path:'units', loadChildren: unitsModule}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
