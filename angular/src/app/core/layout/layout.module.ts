import { NgModule } from '@angular/core';

import { LayoutComponent } from './layout.component';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';

@NgModule({
  declarations: [LayoutComponent],
  imports: [CommonModule, RouterModule],
})
export class LayoutModule {}
