import express from "express";
import conectaMongoDb from "./config/dbconnects.js";
import routes from "./routes/index.js";

const conexao = await conectaMongoDb();
conexao.on("error", (erro) => {
    console.error("Problema ao estabelecer conexão com o Mongo DB", erro);
});
conexao.once("open", () => {
    console.log("Conexão com o mongo db realizada com sucesso");
})

const app = express();
routes(app);

export default app;
