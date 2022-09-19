import { Component, OnInit } from '@angular/core';
import { Player } from 'src/app/shared/models/player';
import { AuthService } from '../../core/authentication/auth.service';
import { PlayerService } from './services/player/player.service';

@Component({
  selector: 'board',
  templateUrl: './board.component.html',
  styleUrls: ['./board.component.scss'],
})
export class BoardComponent implements OnInit {
  players: Player[];
  constructor(
    private _authService: AuthService,
    private _playerService: PlayerService
  ) {}

  ngOnInit(): void {
    this._playerService.getPlayers().subscribe((players) => {
      this.players = players;
      console.log(players);
    });
  }

  logOut(): void {
    this._authService.logout();
  }
}
