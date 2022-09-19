import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';

/**
 * DO NOT import the CoreModule into any modules other than the AppModule.
 */

@NgModule({
  providers: [],
  declarations: [],
  imports: [CommonModule, HttpClientModule],
  exports: [],
})
export class CoreModule {}
