import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LayoutComponent } from './core/layout/layout.component';
import { AuthGuard } from './core/authentication/guards/auth.guard';
import { LoggedInAuthGuard } from './core/authentication/guards/logged-in-auth.guard';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'login',
    pathMatch: 'full',
  },
  {
    path: 'login',
    canActivate: [LoggedInAuthGuard],
    loadChildren: () =>
      import('./features/login/login.module').then((m) => m.LoginModule),
  },
  {
    path: 'board',
    canLoad: [AuthGuard],
    canActivate: [AuthGuard],
    component: LayoutComponent,
    loadChildren: () =>
      import('./features/board/board.module').then((m) => m.BoardModule),
  },
  // otherwise redirect to home
  {
    path: '**',
    redirectTo: '',
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
