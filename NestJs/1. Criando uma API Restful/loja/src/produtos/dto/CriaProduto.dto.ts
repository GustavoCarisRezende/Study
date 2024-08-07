import { ArrayMinSize, IsArray, IsNotEmpty, IsNumber, IsPositive, IsUUID, ValidateNested } from "class-validator";
import { CaracteristicaProdutoDTO } from "./CaracteristicaProduto.dto";
import { ImagemProdutoDTO } from "./ImagemProduto.dto";
import { Type } from "class-transformer";

export class CriaProdutoDto {
  @IsNotEmpty({ message: 'Nome do produto de preenchimento obrigatório' })
  nome: string;
  
  @IsPositive({ message: "O valor do produto precisa ser um número positivo" })
  valor: number;
  
  @IsNumber(undefined, { message: "A quantidade precisa ser preenchida" })
  quantidade: number;
  
  @IsNotEmpty({ message: "A descrição do produto é obrigatória" })
  descricao: string;
  
  @ArrayMinSize(3, {message: "Necessário informar ao menos 3 características do produto" })
  @ValidateNested()
  @IsArray() 
  @Type(() => CaracteristicaProdutoDTO)
  caracteristicas: CaracteristicaProdutoDTO[];
  
  @ArrayMinSize(1, {message: "Necessário informar ao menos 1 imagem do produto" })
  @ValidateNested()
  @IsArray() 
  @Type(() => ImagemProdutoDTO)
  imagens: ImagemProdutoDTO[];
  
  @IsNotEmpty({ message: "Categoria do produto de preenchimento obrigatório" })
  categoria: string;

  @IsUUID(undefined, { message: "ID do usuário de preenchimento obrigatório" })
  usuarioId: string;
}
