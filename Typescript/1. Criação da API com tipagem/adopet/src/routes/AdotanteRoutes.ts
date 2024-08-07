import express from 'express';
import AdotanteRepository from '../repository/AdotanteRepository';
import { AppDataSource } from '../config/dataSource';
import AdotanteController from '../controller/AdotanteController';

const router = express.Router();
const adotanteRepository = new AdotanteRepository(
    AppDataSource.getRepository("AdotanteEntity")
);
const adotanteController = new AdotanteController(adotanteRepository);

router.get("/", (req, res) => adotanteController.listaAdotante(req, res));
router.post("/", (req, res) => adotanteController.criaAdotante(req, res));
router.put("/:id", (req, res) => adotanteController.atualizaAdotante(req, res));
router.delete("/:id", (req, res) => adotanteController.deletaAdotante(req, res));
router.patch("/:id", (req, res) => adotanteController.atualizaEndereco(req, res));

export default router;
