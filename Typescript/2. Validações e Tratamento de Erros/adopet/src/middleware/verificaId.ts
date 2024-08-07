import { NextFunction, Request, Response } from "express";
import { RequisicaoRuim } from "./error";

export const verificaIdMiddleware = (req: Request, res: Response, next: NextFunction) => {
    const params = { ...req.params };
    for(const parametro in params) {
        if(!Number.isInteger(Number(params[parametro]))) {
            throw new RequisicaoRuim("Parâmetro inválido! Precisa ser um número inteiro");
        }
    }
    return next();
}
