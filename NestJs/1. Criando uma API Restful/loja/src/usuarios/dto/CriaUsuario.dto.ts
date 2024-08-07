import { IsEmail, IsNotEmpty, MinLength } from 'class-validator';
import { EmailUnico } from '../validator/email-unico.validator';

export class CriaUsuarioDto {
  
  @IsNotEmpty({ message: 'O nome precisa estar preenchido' })
  nome: string;

  @EmailUnico({ message: 'E-mail já cadastrado em outro usuário' })
  @IsEmail(undefined, { message: 'Email inválido' })
  email: string;

  @MinLength(6, { message: 'A senha precisa contér no mínimo 6 caracteres' })
  senha: string;
};
