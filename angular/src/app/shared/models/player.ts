export interface PlayerParameters {
  id?: string;
  birthdate: Date;
  name: string;
  nationality: string;
  number: number;
  position: string;
}

export class Player {
  id?: string;
  birthdate: Date;
  name: string;
  nationality: string;
  number: number;
  position: string;

  constructor({
    id,
    birthdate,
    name,
    nationality,
    number,
    position,
  }: PlayerParameters) {
    this.id = id;
    this.birthdate = birthdate;
    this.name = name;
    this.nationality = nationality;
    this.number = number;
    this.position = position;
  }
}
