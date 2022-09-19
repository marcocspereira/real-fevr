import {
  HttpErrorResponse,
  HttpHandler,
  HttpInterceptor,
  HttpRequest,
  HTTP_INTERCEPTORS,
} from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable()
/**
 * Interceptor that catches all HttpErrors and allows to use retry(1) function,
 * so all http requests will be retried once before failing.
 */
export class HttpErrorInterceptor implements HttpInterceptor {
  constructor(private _router: Router) {}

  intercept(req: HttpRequest<any>, next: HttpHandler) {
    return next.handle(req).pipe(
      catchError((error: HttpErrorResponse) => {
        let errorMessage: String = '';
        if (error.error instanceof ErrorEvent) {
          // client-side error
          errorMessage = `Error: ${error.error.message}`;
        } else {
          // server-side error
          errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
          this._handleServerError(error);
        }
        return throwError(errorMessage);
      })
    );
  }

  private _handleServerError(error: HttpErrorResponse): void {
    const errorCodes = {
      401: this._unauthorized(),
    };
    errorCodes[error.status];
  }

  private _unauthorized(): void {
    localStorage.removeItem('token');
    localStorage.removeItem('currentUser');
    this._router.navigate(['/login']);
  }
}

export const httpErrorProvider = {
  provide: HTTP_INTERCEPTORS,
  useClass: HttpErrorInterceptor,
  multi: true,
};
