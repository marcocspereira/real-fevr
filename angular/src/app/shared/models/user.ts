export class User {
  private _tokenExpirationDate: Date;

  constructor(
    public id: string,
    public email: string,
    public isAdmin: boolean,
    private _token: string
  ) {
    this._tokenExpirationDate = new Date(this._decodedToken['exp'] * 1000);
  }

  get token(): string {
    if (!this._tokenExpirationDate || new Date() > this._tokenExpirationDate) {
      return null;
    }
    return this._token;
  }

  get tokenExprationDate(): Date {
    return this._tokenExpirationDate;
  }

  private _decodedToken() {
    try {
      return JSON.parse(atob(this._token.split('.')[1]));
    } catch (e) {
      return null;
    }
  }
}
