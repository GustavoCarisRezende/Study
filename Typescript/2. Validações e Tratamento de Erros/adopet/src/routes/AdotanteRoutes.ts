import express, { RequestHandler } from 'express';
import AdotanteRepository from '../repository/AdotanteRepository';
import { AppDataSource } from '../config/dataSource';
import AdotanteController from '../controller/AdotanteController';
import { middlewareValidatorBodyAdotante } from '../middleware/validators/adotanteRequestBody';
import { middlewareValidatorBodyEndereco } from '../middleware/validators/enderecoRequestBody';

const router = express.Router();
const adotanteRepository = new AdotanteRepository(
    AppDataSource.getRepository("AdotanteEntity")
);
const adotanteController = new AdotanteController(adotanteRepository);
const validateBodyAdotante:RequestHandler = (req, res, next) => middlewareValidatorBodyAdotante(req, res, next) 
const validateBodyEndereco:RequestHandler = (req, res, next) => middlewareValidatorBodyEndereco(req, res, next) 

router.get("/", (req, res) => adotanteController.listaAdotante(req, res));

router.post("/", validateBodyAdotante, (req, res) => adotanteController.criaAdotante(req, res));

router.put("/:id", (req, res) => adotanteController.atualizaAdotante(req, res));

router.delete("/:id", (req, res) => adotanteController.deletaAdotante(req, res));

router.patch("/:id", validateBodyEndereco, (req, res) => adotanteController.atualizaEndereco(req, res));

export default router;
