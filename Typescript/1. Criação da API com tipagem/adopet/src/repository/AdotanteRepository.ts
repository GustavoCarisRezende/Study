import { Repository } from "typeorm";
import AdotanteEntity from "../entity/AdotanteEntity";
import InterfaceAdotanteRepository from "./interfaces/InterfaceAdotanteRepository";
import EnderecoEntity from "../entity/EnderecoEntity";

export default class AdotanteRepository implements InterfaceAdotanteRepository {
    
    private repository: Repository<AdotanteEntity>;

    constructor(repository: Repository<AdotanteEntity>) {
        this.repository = repository;
    }

    async criaAdotante(adotante: AdotanteEntity): Promise<void> {
        await this.repository.save(adotante);
    }
    
    async listaAdotante(): Promise<AdotanteEntity[]> {
        return await this.repository.find();
    }
    
    async atualizaAdotante(id: number, newData: AdotanteEntity): Promise<{ sucess: boolean, message?: string }> {
        try {
            const adotanteToUpdate = await this.repository.findOne({ where: { id } });
            if(!adotanteToUpdate) {
                return { sucess: false, message: `Adotante ${id} não encontrado` };
            }

            Object.assign(adotanteToUpdate, newData);

            await this.repository.save(adotanteToUpdate);

            return { sucess: true };
        } catch(error) {
            console.log(error);
            return { sucess: false, message: "Ocorreu um problema ao tentar atualizar o adotante" };
        }
    }
    
    async deletaAdotante(id: number): Promise<{ sucess: boolean; message?: string; }> {
        try {
            const adotanteToDelete = await this.repository.findOne({ where: { id } });
            if(!adotanteToDelete) {
                return { sucess: false, message: `Adotante ${id} não encontrado` };
            }

            await this.repository.remove(adotanteToDelete);

            return { sucess: true };
        } catch(error) {
            console.log(error);
            return { sucess: false, message: "Ocorreu um problema ao tentar excluir o adotante" };
        }
    }

    async atualizaEnderecoAdotante(idAdotante: number, endereco: EnderecoEntity): Promise<{ sucess: boolean; message?: string; }>{
        const adotante = await this.repository.findOne({ where: { id: idAdotante } });
        if(!adotante) {
            return { sucess: false, message: `Adotante ${idAdotante} não encontrado` };
        }
        const novoEndereco = new EnderecoEntity(endereco.cidade, endereco.estado);
        adotante.endereco = novoEndereco;
        await this.repository.save(adotante);
        return { sucess: true };
    }
}