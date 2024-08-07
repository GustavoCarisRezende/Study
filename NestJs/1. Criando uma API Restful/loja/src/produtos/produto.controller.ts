import { Body, Controller, Get, Post } from "@nestjs/common";
import { ProdutoRepository } from "./produto.repository";
import { CriaProdutoDto } from "./dto/CriaProduto.dto";

@Controller('/produtos')
export class ProdutoController {

  constructor(private produtoRepository: ProdutoRepository) {};

  @Post()
  async createProduto(@Body() produto: CriaProdutoDto) {
    this.produtoRepository.salvar(produto);
  }

  @Get()
  async listProdutos() {
    return this.produtoRepository.listar();
  }
}
