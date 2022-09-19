import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';

import { AppComponent } from './app.component';
import { authProvider } from './core/authentication/auth.interceptor';
import { CoreModule } from './core/core.module';
import { LayoutModule } from './core/layout/layout.module';
import { apiNamingConventionProvider } from './core/request-interceptor/api-naming-convention/api-naming-convention.interceptor';
import { tokenProvider } from './core/request-interceptor/token/token.interceptor';
import { versionManagerProvider } from './core/request-interceptor/version-manager/version-manager.interceptor';
import { angularNamingConventionProvider } from './core/response-interceptor/angular-naming-convention/angular-naming-convention.interceptor';
import { httpErrorProvider } from './core/response-interceptor/http-error/http-error.interceptor';

@NgModule({
  declarations: [AppComponent],
  imports: [
    CoreModule,
    BrowserModule,
    AppRoutingModule,
    //BrowserAnimationsModule,
    LayoutModule,
  ],
  providers: [
    // interceptors
    versionManagerProvider,
    //fakeBackendProvider,
    tokenProvider,
    authProvider,
    angularNamingConventionProvider,
    apiNamingConventionProvider,
    httpErrorProvider,
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
