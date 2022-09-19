import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HTTP_INTERCEPTORS,
} from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class ApiNamingConventionInterceptor implements HttpInterceptor {
  constructor() {}

  intercept(
    req: HttpRequest<unknown>,
    next: HttpHandler
  ): Observable<HttpEvent<unknown>> {
    if (this._isObject(req.body)) {
      return next.handle(req.clone({ body: this._keysToSnake(req.body) }));
    }

    return next.handle(req);
  }

  /**
   * Evaulates if:
   * - the object is an Object
   * - the object is not null
   * - it is an array
   * - it is not a function
   * @param o
   * @returns
   */
  private _isObject(o): boolean {
    return o === Object(o) || (Array.isArray(o) && typeof o !== 'function');
  }

  /**
   * If it is an object, it loops through all of its keys, convert each key
   * to snake case, and recursively call this keysToSnake function.
   * @param o object
   * @returns
   */
  private _keysToSnake(o) {
    if (o === Object(o) && !Array.isArray(o) && typeof o !== 'function') {
      const n = {};

      Object.keys(o).forEach((k) => {
        n[this._toSnake(k)] = this._keysToSnake(o[k]);
      });

      return n;
    } else if (Array.isArray(o)) {
      return o.map((i) => {
        return this._keysToSnake(i);
      });
    }

    return o;
  }

  /**
   * It does a regex replace on the string, searching for either a capitalized character.
   * It won't work if string has spaces.
   * @param word in camel case to convert to snake case
   * @returns word with snake case
   */
  private _toSnake(word: string): string {
    // The i at the end of the regex tells it to ignore case, so we match kebab-case as well as kebab-Case.
    // Matches are warapped in parenthesis, ([-_][a-z]), which turns them into the matching group $1.
    return word.replace(/([A-Z])/g, ($1) => {
      return `_${$1.toLocaleLowerCase()}`;
    });
  }
}

export const apiNamingConventionProvider = {
  provide: HTTP_INTERCEPTORS,
  useClass: ApiNamingConventionInterceptor,
  multi: true,
};
