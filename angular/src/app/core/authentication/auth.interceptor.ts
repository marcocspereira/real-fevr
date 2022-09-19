import {
  HttpHandler,
  HttpInterceptor,
  HttpRequest,
  HTTP_INTERCEPTORS,
} from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AuthService } from './auth.service';

@Injectable()
/**
 * Interceptor that includes the JWT with each request sent to
 * the application server.
 */
export class AuthInterceptor implements HttpInterceptor {
  constructor(private _authService: AuthService) {}

  intercept(req: HttpRequest<any>, next: HttpHandler) {
    const authToken = this._authService.currentUser?.token;

    if (authToken) {
      req = req.clone({
        setHeaders: {
          Authorization: 'Bearer ' + authToken,
        },
      });
    }
    console.log(authToken);
    return next.handle(req);
  }
}

export const authProvider = {
  provide: HTTP_INTERCEPTORS,
  useClass: AuthInterceptor,
  multi: true,
};
