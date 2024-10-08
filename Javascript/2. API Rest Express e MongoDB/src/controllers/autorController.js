import {autor} from '../models/Autor.js';

class AutorController {

    static async getAll(req, res) {
        try {
            res.status(200).json(await autor.find({}));
        } catch(error) {
            console.log(error)
            res.status(500).json({ message: `${error.message} - falha ao listar todos os autores` });
        }
    }

    static async getById(req, res) {
        try {
            res.status(200).json(await autor.findById(req.params.id));
        } catch(error) {
            res.status(500).json({ message: `${error.message} - falha ao listar o autor` });
        }
    }

    static async create(req, res) {
        try {
            const novoAutor = await autor.create(req.body);
            res.status(201).json({ message: "Autor cadastrado com sucesso", content: novoAutor });
        } catch(error) {
            res.status(500).json({ message: `${error.message} - falha ao cadastrar o autor` });
        }
    }

    static async update(req, res) {
        try {
            await autor.findByIdAndUpdate(req.params.id, req.body);
            res.status(200).json({ message: "Autor atualizado com sucesso" });
        } catch(error) {
            res.status(500).json({ message: `${error.message} - falha ao atualizar o autor` });
        }
    }

    static async delete(req, res) {
        try {
            await autor.findByIdAndDelete(req.params.id);
            res.status(200).json({ message: "Autor deletado com sucesso" })
        } catch (error) {
            res.status(500).json({ message: `${error.message} - falha ao deletar o autor` });
        }
    }
}

export default AutorController;
