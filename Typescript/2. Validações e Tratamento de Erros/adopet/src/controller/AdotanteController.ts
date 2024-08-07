import { Request, Response } from "express";
import AdotanteRepository from "../repository/AdotanteRepository";
import AdotanteEntity from "../entity/AdotanteEntity";
import EnderecoEntity from "../entity/EnderecoEntity";
import { TipoRequestBodyAdotante, TipoRequestParamsAdotante, TipoResponseBodyAdotante } from "../tipos/tiposAdotante";

export default class AdotanteController {
    
    constructor(private repository: AdotanteRepository) {}

    async criaAdotante(
        req: Request<{}, {}, TipoRequestBodyAdotante>,
        res: Response<TipoResponseBodyAdotante>
    ) {
        try {
            const { nome, senha, celular, foto, endereco } = <AdotanteEntity> req.body;
            const novoAdotante = new AdotanteEntity(nome, senha, celular, foto, endereco);
            await this.repository.criaAdotante(novoAdotante);

            return res.status(201).json({ dados: {id:novoAdotante.id, nome, celular, endereco} });
        } catch(erros) {
            console.log(erros);
            return res.sendStatus(404);
        }
    }

    async listaAdotante(
        req: Request<TipoRequestParamsAdotante, {}, TipoRequestBodyAdotante>,
        res: Response<TipoResponseBodyAdotante>
    ) {
        try {
            const listaAdotantes = await this.repository.listaAdotante();
            const dados = listaAdotantes.map((adotante) => {
                return {
                    id:adotante.id,
                    nome:adotante.nome,
                    celular:adotante.celular,
                    endereco: adotante.endereco !== null? adotante.endereco : undefined,
                }
            });
            return res.status(200).json({ dados });
        } catch(erros) {
            console.log(erros);
            return res.status(404).json({ erros: "Houve um erros ao listar os adotantes" });
        }
    }

    async atualizaAdotante(
        req: Request<TipoRequestParamsAdotante, {}, TipoRequestBodyAdotante>,
        res: Response<TipoResponseBodyAdotante>
    ) {
        const { id } = req.params;
        const { sucess, message } = await this.repository.atualizaAdotante(Number(id), <AdotanteEntity> req.body);
        if(!sucess) {
            return res.status(404).send({ erros: message });
        } else {
            return res.sendStatus(204);
        }
    }

    async deletaAdotante(
        req: Request<TipoRequestParamsAdotante, {}, TipoRequestBodyAdotante>,
        res: Response<TipoResponseBodyAdotante>
    ) {
        const { id } = req.params;
        const { sucess, message } = await this.repository.deletaAdotante(Number(id));
        if(!sucess) {
            return res.status(404).send({ erros: message });
        } else {
            return res.sendStatus(204);
        }
    }

    async atualizaEndereco(
        req: Request<TipoRequestParamsAdotante, {}, EnderecoEntity>,
        res: Response<TipoResponseBodyAdotante>
    ) {
        const { id } = req.params;
        const { sucess, message } = await this.repository.atualizaEnderecoAdotante(Number(id), req.body);
        if(!sucess) {
            return res.status(404).send({ erros: message });
        } else {
            return res.sendStatus(204);
        }
    }
}