import { IsEmail, IsNotEmpty, IsOptional, MinLength } from 'class-validator';
import { EmailUnico } from '../validator/email-unico.validator';

export class AtualizaUsuarioDto {
  
  @IsOptional()
  @IsNotEmpty({ message: 'O nome precisa estar preenchido' })
  nome: string;

  @IsOptional()
  @EmailUnico({ message: 'E-mail já cadastrado em outro usuário' })
  @IsEmail(undefined, { message: 'Email inválido' })
  email: string;

  @IsOptional()
  @MinLength(6, { message: 'A senha precisa contér no mínimo 6 caracteres' })
  senha: string;
};
