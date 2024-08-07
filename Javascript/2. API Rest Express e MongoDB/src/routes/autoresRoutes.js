import express from "express";
import AutorController from "../controllers/autorController.js";

const routes = express.Router();

routes.get('/autores', AutorController.getAll);
routes.get('/autores/:id', AutorController.getById);
routes.post('/autores', AutorController.create);
routes.put('/autores/:id', AutorController.update);
routes.delete('/autores/:id', AutorController.delete);

export default routes;
