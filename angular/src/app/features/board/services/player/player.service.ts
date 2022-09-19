import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Player } from '../../../../shared/models/player';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment.development';

@Injectable({
  providedIn: 'root',
})
export class PlayerService {
  private _playersURL = `${environment.apiAddress}/players`;

  constructor(private _httpService: HttpClient) {}

  getPlayers(): Observable<Player[]> {
    return this._httpService.get<Player[]>(this._playersURL);
  }

  getPlayer(
    playerId: string,
    isAdminMode: boolean = false
  ): Observable<Player> {
    return this._httpService.get<Player>(`${this._playersURL}/${playerId}`);
  }

  editPlayer(player: Player): Observable<Player> {
    return this._httpService.put<Player>(`${this._playersURL}/${player.id}`, {
      player: player,
    });
  }

  createPlayer(player: Player): Observable<Player> {
    return this._httpService.post<Player>(this._playersURL, {
      player: player,
    });
  }

  deletePlayer(playerId: string) {
    return this._httpService.delete(`${this._playersURL}/${playerId}`);
  }
}
