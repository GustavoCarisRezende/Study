import { IsNotEmpty, IsUrl } from "class-validator";

export class ImagemProdutoDTO {
  @IsNotEmpty({ message: "URL da imagem obrigatória" })
  @IsUrl(undefined, { message: "URL inválida" })
  url: string;

  @IsNotEmpty({ message: "Descrição da imagem obrigatória" })
  descricao: string;
}