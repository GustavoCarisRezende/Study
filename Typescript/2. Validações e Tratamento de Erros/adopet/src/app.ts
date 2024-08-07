import "express-async-errors";
import express, { Response } from "express";
import router from "./routes";
import "reflect-metadata";
import { AppDataSource } from "./config/dataSource";
import { erroMiddleware } from "./middleware/error";


const app = express();
app.use(express.json());
router(app);
app.use(erroMiddleware);

AppDataSource.initialize().then(() => {
    console.log("Banco de dados Sqlite conectado")
}).catch((error) => {
    console.log(`${error} - Problema na inicialização do Sqlite`)
})

export default app;
