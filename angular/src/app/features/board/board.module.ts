import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BoardClientRoutingModule } from './board-routing.module';
import { BoardComponent } from './board.component';

@NgModule({
  providers: [],
  declarations: [BoardComponent],
  imports: [CommonModule, BoardClientRoutingModule],
  exports: [BoardComponent],
})
export class BoardModule {}
