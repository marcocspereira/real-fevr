import { Injectable } from '@angular/core';
import {
  ActivatedRoute,
  ActivatedRouteSnapshot,
  CanActivate,
  Router,
  RouterStateSnapshot,
} from '@angular/router';
import { AuthService } from '../auth.service';

@Injectable({ providedIn: 'root' })
export class LoggedInAuthGuard implements CanActivate {
  constructor(
    private _authService: AuthService,
    private _router: Router,
    private _activatedRoute: ActivatedRoute
  ) {}

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): boolean {
    if (this._authService.currentUser) {
      const destinyUrl =
        this._activatedRoute.snapshot.queryParams['redirectURL'] || 'board';
      this._router.navigateByUrl(destinyUrl);
      return false;
    } else {
      return true;
    }
  }
}
