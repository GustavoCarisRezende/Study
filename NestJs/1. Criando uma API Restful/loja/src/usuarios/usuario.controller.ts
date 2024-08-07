import { Body, Controller, Get, Param, Post, Put } from '@nestjs/common';
import { UsuarioRepository } from './usuario.repository';
import { CriaUsuarioDto } from './dto/CriaUsuario.dto';
import { UsuarioEntity } from './usuario.entity';
import { v4 as uuid } from 'uuid';
import { ListaUsuarioDto } from './dto/ListaUsuario.dto';
import { AtualizaUsuarioDto } from './dto/AtualizaUsuario.dto';

@Controller('/usuarios')
export class UsuarioController {
  
  constructor(private usuarioRepository: UsuarioRepository) {}

  @Post()
  async createUsuario(@Body() dadosDoUsuario: CriaUsuarioDto) {
    const usuarioEntity = new UsuarioEntity();
    usuarioEntity.email = dadosDoUsuario.email;
    usuarioEntity.nome = dadosDoUsuario.nome;
    usuarioEntity.senha = dadosDoUsuario.senha;
    usuarioEntity.id = uuid();
    this.usuarioRepository.salvar(usuarioEntity);
    return { usuario: new ListaUsuarioDto(usuarioEntity.id, usuarioEntity.nome), message: 'Usuário criado com sucesso' };
  }

  @Get()
  async listUsuarios() {
    const usuariosSalvos = await this.usuarioRepository.listar();
    return usuariosSalvos.map(
      usuario => new ListaUsuarioDto(usuario.id, usuario.nome)
    );
  }

  @Put('/:id')
  async atualizaUsuario(@Param('id') id: string, @Body() novosDados: AtualizaUsuarioDto) {
    const usuarioAtualizado = await this.usuarioRepository.atualiza(id, novosDados);
    return {
      usuario: new ListaUsuarioDto(usuarioAtualizado.id, usuarioAtualizado.nome),
      message: "Usuário atualizado com sucesso",
    };
  }
}
