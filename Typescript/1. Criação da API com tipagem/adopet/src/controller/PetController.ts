import { Request, Response } from "express";
import EnumEspecie from "../enum/EnumEspecie";
import PetRepository from "../repository/PetRepository";
import PetEntity from "../entity/PetEntity";
import EnumPorte from "../enum/EnumPorte";

export default class PetController {

    constructor(private repository: PetRepository) {}

    async criaPet(req:Request, res:Response) {
        const { nome, especie, porte, adotado, dataNascimento } = <PetEntity> req.body;
        if(!Object.values(EnumEspecie).includes(especie)) {
            return res.status(400).json({ error: "Espécie inválida" });
        }
        if(porte && !(porte in EnumPorte)) {
            return res.status(400).json({ error: "Porte inválido" });
        }
        
        const novoPet: PetEntity = new PetEntity(nome, especie, dataNascimento, adotado, porte);
        
        await this.repository.criaPet(novoPet);
        return res.status(201).json(novoPet);
    }

    async listaPet(req: Request, res: Response) {
        const listaPets = await this.repository.listaPet();
        return res.status(200).json(listaPets);
    }

    async atualizaPet(req: Request, res: Response) {
        const { id } = req.params;
        const { sucess, message } = await this.repository.atualizaPet(Number(id), req.body as PetEntity);
        if(!sucess) {
            return res.status(404).json({ message });
        } else {
            return res.sendStatus(204);
        }
    }

    async deletaPet(req: Request, res: Response) {
        const { id } = req.params;
        const { sucess, message } = await this.repository.deletaPet(Number(id));
        if(!sucess) {
            return res.status(404).json({ message });
        } else {
            return res.sendStatus(204);
        }
    }

    async adotaPet(req: Request, res: Response) {
        const { pet_id, id_adotante } = req.params;
        const { sucess, message } = await this.repository.adotaPet(Number(pet_id), Number(id_adotante));
        if(!sucess) {
            return res.status(404).json({ message });
        }
        return res.sendStatus(204);
    }

    async buscaPetPorCampoGenerico(req: Request, res: Response) {
        const { campo, valor } = req.query;
        const listaPets = await this.repository.buscaPetPorCampoGenerico(campo as keyof PetEntity, valor as string);
        return res.status(200).json(listaPets);
    }
}
