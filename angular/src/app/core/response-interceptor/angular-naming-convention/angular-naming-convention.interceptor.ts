import {
  HttpHandler,
  HttpInterceptor,
  HttpRequest,
  HttpResponse,
  HTTP_INTERCEPTORS,
} from '@angular/common/http';
import { Injectable } from '@angular/core';
import { filter, map } from 'rxjs/operators';

@Injectable()
/**
 * Interceptor that includes the JWT with each request sent to
 * the application server.
 */
export class AngularNamingConventionInterceptor implements HttpInterceptor {
  constructor() {}

  intercept(req: HttpRequest<any>, next: HttpHandler) {
    return next.handle(req).pipe(
      // proceed when there is a response; ignore other events
      filter((event) => event instanceof HttpResponse),
      map((response: HttpResponse<any>) => {
        if (response.body && this._isObject(response.body)) {
          // only parse bodies with objects, pass all other responses to other interceptors
          return response.clone({ body: this._keysToCamel(response.body) });
        }
        return response;
      })
    );
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
   * to camel case, and recursively call this keysToCamel function.
   * @param o object
   * @returns
   */
  private _keysToCamel(o) {
    if (o === Object(o) && !Array.isArray(o) && typeof o !== 'function') {
      const n = {};

      Object.keys(o).forEach((k) => {
        n[this._toCamel(k)] = this._keysToCamel(o[k]);
      });

      return n;
    } else if (Array.isArray(o)) {
      return o.map((i) => {
        return this._keysToCamel(i);
      });
    }

    return o;
  }

  /**
   * It does a regex replace on the string, searching for either a dash or an underscore, followed by a letter a-z.
   * It won't work if string has spaces.
   * @param word in snake ou kebab case to convert to camel case
   * @returns word with camel case
   */
  private _toCamel(word: string): string {
    // The i at the end of the regex tells it to ignore case, so we match kebab-case as well as kebab-Case.
    // Matches are warapped in parenthesis, ([-_][a-z]), which turns them into the matching group $1.
    return word.replace(/([-_][a-z])/gi, ($1) => {
      return $1.toUpperCase().replace('-', '').replace('_', '');
    });
  }
}

export const angularNamingConventionProvider = {
  provide: HTTP_INTERCEPTORS,
  useClass: AngularNamingConventionInterceptor,
  multi: true,
};
