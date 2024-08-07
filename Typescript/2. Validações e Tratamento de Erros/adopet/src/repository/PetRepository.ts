import { Repository } from "typeorm";
import PetEntity from "../entity/PetEntity";
import InterfacePetRepository from "./interfaces/InterfacePetRepository";
import AdotanteEntity from "../entity/AdotanteEntity";
import { NaoEncontrado } from "../middleware/error";

export default class PetRepository implements InterfacePetRepository {

    private repository: Repository<PetEntity>;
    private adotanteRepository: Repository<AdotanteEntity>;

    constructor(repository: Repository<PetEntity>, adotanteRepository: Repository<AdotanteEntity>) {
        this.repository = repository;
        this.adotanteRepository = adotanteRepository;
    }

    async criaPet(pet: PetEntity): Promise<void> {
        await this.repository.save(pet);
    }

    async listaPet(): Promise<PetEntity[]> {
        return await this.repository.find();
    }

    async atualizaPet(id: number, newData: PetEntity): Promise<{ sucess: boolean, message?: string }> {
        const petToUpdate = await this.repository.findOne({ where: { id } });
        if(!petToUpdate) {
            throw new NaoEncontrado("Pet não encontrado!");
        }
        Object.assign(petToUpdate, newData);
        await this.repository.save(petToUpdate);
        return { sucess: true };
    }

    async deletaPet(id: number): Promise<{ sucess: boolean, message?: string }> {
        const petToRemove = await this.repository.findOne({ where: { id } });
        if(!petToRemove) {
            throw new NaoEncontrado("Pet não encontrado!");
        }
        await this.repository.remove(petToRemove);
        return { sucess: true };
    }

    async adotaPet(idPet: number, idAdotante: number) : Promise<{ sucess: boolean, message?: string }> {
        const pet = await this.repository.findOne({ where: { id: idPet } });
        if(!pet) {
            throw new NaoEncontrado("Pet não encontrado!");
        }

        const adotante = await this.adotanteRepository.findOne({where: { id: idAdotante }});
        if(!adotante) {
            throw new NaoEncontrado("Adotante não encontrado!");
        }

        pet.adotante = adotante;
        pet.adotado = true;
        await this.repository.save(pet);
        return { sucess: true };
    }

    async buscaPetPorCampoGenerico<Tipo extends keyof PetEntity>(campo: Tipo, valor: PetEntity[Tipo]): Promise<PetEntity[]> {
        return await this.repository.find({ where: { [campo]: valor } });
    }
}
