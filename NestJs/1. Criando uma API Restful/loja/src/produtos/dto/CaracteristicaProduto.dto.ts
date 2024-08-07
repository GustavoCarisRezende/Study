import { IsNotEmpty } from "class-validator";

export class CaracteristicaProdutoDTO {
  @IsNotEmpty({ message: "Nome obrigatório" })
  nome: string;

  @IsNotEmpty({ message: "Descrição obrigatória" })
  descricao: string;
}
