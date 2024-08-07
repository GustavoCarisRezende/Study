import express from "express";
import LivroController from "../controllers/livroController.js";

const routes = express.Router();

routes.get('/livros', LivroController.listarLivros);
routes.get('/livros/busca', LivroController.listarLivrosPorEditora);
routes.get('/livros/:id', LivroController.listarLivroPeloId);
routes.post('/livros', LivroController.cadastrarLivro);
routes.put('/livros/:id', LivroController.atualizaLivro);
routes.delete('/livros/:id', LivroController.deletaLivro);

export default routes;
