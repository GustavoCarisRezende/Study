import { Request, Response } from "express";
import EnumEspecie from "../enum/EnumEspecie";
import PetRepository from "../repository/PetRepository";
import PetEntity from "../entity/PetEntity";
import EnumPorte from "../enum/EnumPorte";
import { TipoRequestBodyPet, TipoRequestParamsPet, TipoResponseBodyPet } from "../tipos/tiposPet";

export default class PetController {

    constructor(private repository: PetRepository) {}

    async criaPet(
        req: Request,
        res: Response<TipoResponseBodyPet>
    ) {
        const { nome, especie, porte, adotado, dataNascimento } = <PetEntity> req.body;
        
        const novoPet: PetEntity = new PetEntity(nome, especie, dataNascimento, adotado, porte);
        
        await this.repository.criaPet(novoPet);

        return res.status(201).json({ dados: { id:novoPet.id, nome, especie, porte } });
    }

    async listaPet(
        req: Request<TipoRequestParamsPet, {}, TipoRequestBodyPet>,
        res: Response<TipoResponseBodyPet>
    ) {
        const listaPets = await this.repository.listaPet();
        const dados = listaPets.map((pet) => {
            return {
                id: pet.id,
                nome: pet.nome,
                especie: pet.especie,
                porte: pet.porte !== null? pet.porte: undefined
            }
        });
        return res.status(200).json({ dados });
    }

    async atualizaPet(
        req: Request<TipoRequestParamsPet, {}, TipoRequestBodyPet>,
        res: Response<TipoResponseBodyPet>
    ) {
        const { id } = req.params;
        const { sucess, message } = await this.repository.atualizaPet(Number(id), req.body as PetEntity);
        if(!sucess) {
            return res.status(404).json({ erros: message });
        } else {
            return res.sendStatus(204);
        }
    }

    async deletaPet(
        req: Request<TipoRequestParamsPet, {}, TipoRequestBodyPet>,
        res: Response<TipoResponseBodyPet>
    ) {
        const { id } = req.params;
        const { sucess, message } = await this.repository.deletaPet(Number(id));
        if(!sucess) {
            return res.status(404).json({ erros: message });
        } else {
            return res.sendStatus(204);
        }
    }

    async adotaPet(
        req: Request<TipoRequestParamsPet, {}, TipoRequestBodyPet>,
        res: Response<TipoResponseBodyPet>
    ) {
        const { pet_id, id_adotante } = req.params;
        const { sucess, message } = await this.repository.adotaPet(Number(pet_id), Number(id_adotante));
        if(!sucess) {
            return res.status(404).json({ erros: message });
        }
        return res.sendStatus(204);
    }

    async buscaPetPorCampoGenerico(req: Request, res: Response) {
        const { campo, valor } = req.query;
        const listaPets = await this.repository.buscaPetPorCampoGenerico(campo as keyof PetEntity, valor as string);
        return res.status(200).json(listaPets);
    }
}
