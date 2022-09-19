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
export class VersionManagerInterceptor implements HttpInterceptor {
  constructor() {}

  intercept(
    request: HttpRequest<unknown>,
    next: HttpHandler
  ): Observable<HttpEvent<unknown>> {
    const versionRegex: RegExp = /v\d/g;
    if (request.url.match(versionRegex)) return next.handle(request);

    const duplicatedRequest = request.clone({
      url: this._addVersionToUrl(request.url),
    });

    return next.handle(duplicatedRequest);
  }

  private _addVersionToUrl(url: string, version: string = 'v1') {
    const urlFragments: string[] = url.split('api');
    return `${urlFragments[0] + 'api/' + version + urlFragments[1]}`;
  }
}

export const versionManagerProvider = {
  provide: HTTP_INTERCEPTORS,
  useClass: VersionManagerInterceptor,
  multi: true,
};
