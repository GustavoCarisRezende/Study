import { Repository } from "typeorm";
import AdotanteEntity from "../entity/AdotanteEntity";
import InterfaceAdotanteRepository from "./interfaces/InterfaceAdotanteRepository";
import EnderecoEntity from "../entity/EnderecoEntity";
import { NaoEncontrado, RequisicaoRuim } from "../middleware/error";

export default class AdotanteRepository implements InterfaceAdotanteRepository {
    
    private repository: Repository<AdotanteEntity>;

    constructor(repository: Repository<AdotanteEntity>) {
        this.repository = repository;
    }

    private async verificaCelularAdotante(celular: string) {
        return await this.repository.findOne({ where: {celular} });
    }

    async criaAdotante(adotante: AdotanteEntity): Promise<void> {
        if(await this.verificaCelularAdotante(adotante.celular)) {
            throw new RequisicaoRuim("Celular já cadastrado")!
        }
        await this.repository.save(adotante);
    }
    
    async listaAdotante(): Promise<AdotanteEntity[]> {
        return await this.repository.find();
    }
    
    async atualizaAdotante(id: number, newData: AdotanteEntity): Promise<{ sucess: boolean, message?: string }> {
        const adotanteToUpdate = await this.repository.findOne({ where: { id } });
        if(!adotanteToUpdate) {
            throw new NaoEncontrado("Adotante não encontrado!");
        }
        Object.assign(adotanteToUpdate, newData);
        await this.repository.save(adotanteToUpdate);
        return { sucess: true };
    }
    
    async deletaAdotante(id: number): Promise<{ sucess: boolean; message?: string; }> {
        const adotanteToDelete = await this.repository.findOne({ where: { id } });
        if(!adotanteToDelete) {
            throw new NaoEncontrado("Adotante não encontrado!");
        }
        await this.repository.remove(adotanteToDelete);
        return { sucess: true };
    }

    async atualizaEnderecoAdotante(idAdotante: number, endereco: EnderecoEntity): Promise<{ sucess: boolean; message?: string; }>{
        const adotante = await this.repository.findOne({ where: { id: idAdotante } });
        if(!adotante) {
            throw new NaoEncontrado("Adotante não encontrado!");
        }
        const novoEndereco = new EnderecoEntity(endereco.cidade, endereco.estado);
        adotante.endereco = novoEndereco;
        await this.repository.save(adotante);
        return { sucess: true };
    }
}