import { Module } from "@nestjs/common";
import { UsuarioController } from "./usuario.controller";
import { UsuarioRepository } from "./usuario.repository";
import { EmailUnicaValidator } from "./validator/email-unico.validator";

@Module({ 
  controllers: [UsuarioController],
  providers: [UsuarioRepository, EmailUnicaValidator]
})
export class UsuarioModule {}
