import { Injectable } from "@nestjs/common";
import { UsuarioEntity } from "./usuario.entity";
import { AtualizaUsuarioDto } from "./dto/AtualizaUsuario.dto";

@Injectable()
export class UsuarioRepository {

  private usuarios: UsuarioEntity[] = [];

  async salvar(usuario: UsuarioEntity) {
    this.usuarios.push(usuario);
  }

  async listar() {
    return this.usuarios;
  }

  async atualiza(id: string, novosDados: Partial<UsuarioEntity>) {
    const possivelUsuario = this.usuarios.find(usuarioSalvo => usuarioSalvo.id === id);
    if(!possivelUsuario) {
      throw new Error('Usuário não encontrado');
    }

    Object.entries(novosDados).forEach(([chave, valor]) => {
      if(chave === 'id') {
        return;
      }
      possivelUsuario[chave] = valor;
    });
    return possivelUsuario;
  }

  async emailJaCadastrado(email: string): Promise<boolean> {
    if(this.usuarios.find(usuario => usuario.email === email)) {
      return false;
    } else {
      return true;
    }
  }
}
