import express, { RequestHandler } from 'express';
import PetController from '../controller/PetController';
import PetRepository from '../repository/PetRepository';
import { AppDataSource } from '../config/dataSource'; 
import { middlewareValidatorBodyPet } from '../middleware/validators/petRequestBody';
import { verificaIdMiddleware } from '../middleware/verificaId';

const router = express.Router();
const petRepository = new PetRepository(
    AppDataSource.getRepository("PetEntity"),
    AppDataSource.getRepository("AdotanteEntity")
);
const petController = new PetController(petRepository);
const validateBodyPet: RequestHandler = (req, res, next) => middlewareValidatorBodyPet(req, res, next) 

router.get("/", (req, res) => petController.listaPet(req, res));
router.post("/", validateBodyPet, (req, res) => petController.criaPet(req, res));
router.put("/:id", verificaIdMiddleware, (req, res) => petController.atualizaPet(req, res));
router.delete("/:id", verificaIdMiddleware, (req, res) => petController.deletaPet(req, res));
router.put("/:pet_id/:id_adotante", verificaIdMiddleware, (req, res) => petController.adotaPet(req, res));
router.get("/filtro", (req, res) => petController.buscaPetPorCampoGenerico(req, res));

export default router;
