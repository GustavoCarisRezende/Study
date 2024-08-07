import { Request, Response } from "express";
import AdotanteRepository from "../repository/AdotanteRepository";
import AdotanteEntity from "../entity/AdotanteEntity";
import EnderecoEntity from "../entity/EnderecoEntity";

export default class AdotanteController {
    
    constructor(private repository: AdotanteRepository) {}

    async criaAdotante(req: Request, res: Response) {
        try {
            const { nome, senha, celular, foto, endereco } = <AdotanteEntity> req.body;
            const novoAdotante = new AdotanteEntity(nome, senha, celular, foto, endereco);
            await this.repository.criaAdotante(novoAdotante);
            return res.status(201).json(novoAdotante);
        } catch(error) {
            console.log(error);
            return res.status(404).json({ error: "Houve um erro ao tentar cadastrar o adotante" });
        }
    }

    async listaAdotante(req: Request, res: Response) {
        try {
            const listaAdotantes = await this.repository.listaAdotante();
            return res.status(200).json(listaAdotantes);
        } catch(error) {
            console.log(error);
            return res.status(404).json({ error: "Houve um erro ao listar os adotantes" });
        }
    }

    async atualizaAdotante(req: Request, res: Response) {
        const { id } = req.params;
        const { sucess, message } = await this.repository.atualizaAdotante(Number(id), <AdotanteEntity> req.body);
        if(!sucess) {
            return res.status(404).send(message);
        } else {
            return res.sendStatus(204);
        }
    }

    async deletaAdotante(req: Request, res: Response) {
        const { id } = req.params;
        const { sucess, message } = await this.repository.deletaAdotante(Number(id));
        if(!sucess) {
            return res.status(404).send(message);
        } else {
            return res.sendStatus(204);
        }
    }

    async atualizaEndereco(req: Request, res: Response) {
        const { id } = req.params;
        const { sucess, message } = await this.repository.atualizaEnderecoAdotante(Number(id), req.body as EnderecoEntity);
        if(!sucess) {
            return res.status(404).send(message);
        } else {
            return res.sendStatus(204);
        }
    }
}