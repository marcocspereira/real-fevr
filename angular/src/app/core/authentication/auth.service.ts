import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { tap, shareReplay } from 'rxjs/operators';
import { Router } from '@angular/router';
import { User } from '../../shared/models/user';
import { environment } from 'src/environments/environment.development';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private _authUrl = `${environment.apiAddress}/auth`;

  constructor(private _httpService: HttpClient, private _router: Router) {}

  get currentUser(): User {
    return JSON.parse(localStorage.getItem('currentUser'));
  }

  login(email: string, password: string): Observable<User> | null {
    return this._httpService
      .post<User>(`${this._authUrl}/login`, {
        email,
        password,
      })
      .pipe(tap(this._setSession), shareReplay());
  }

  logout(): void {
    this._httpService.get(`${this._authUrl}/logout`).subscribe(() => {
      localStorage.removeItem('token');
      localStorage.removeItem('currentUser');
      this._router.navigate(['/']);
    });
  }

  get token(): string {
    return localStorage.getItem('token');
  }

  static isLogged(): boolean {
    if (localStorage.getItem('token') && localStorage.getItem('currentUser')) {
      return true;
    }
    return false;
  }

  private _setSession(loginResult): User {
    const { user, token } = loginResult;
    console.log(user);
    const currentUser = new User(
      user['id'],
      user['email'],
      user['isActive'],
      token
    );

    localStorage.setItem('token', loginResult.token);
    localStorage.setItem('currentUser', JSON.stringify(currentUser));
    return currentUser;
  }
}
