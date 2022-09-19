import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'alusape-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.scss'],
})
export class LayoutComponent implements OnInit {
  title = 'client';
  visible = false;
  constructor() {}

  ngOnInit(): void {}
}
