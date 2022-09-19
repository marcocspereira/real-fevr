import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../core/authentication/auth.service';

@Component({
  selector: 'alusape-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  userAuthData: AuthData;

  constructor(private _authService: AuthService, private _router: Router) {
    this.userAuthData = { email: '', password: '' };
  }

  ngOnInit(): void {
    if (this._authService.currentUser) {
      this._router.navigate(['board']);
    }
  }

  onSubmit(loginForm) {
    if (loginForm.valid) {
      this._authService
        .login(loginForm.value.userEmail, loginForm.value.userPassword)
        .subscribe(
          (data) => {
            console.log(data);
            const destiny = data === null ? 'login' : 'board';

            this._router.navigate([destiny]);
          },
          (error) => {
            console.error(error);
          }
        );
    }
  }
}

type AuthData = {
  email: string;
  password: string;
};
