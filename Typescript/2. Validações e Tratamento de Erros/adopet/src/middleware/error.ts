import { NextFunction, Request, Response } from "express";
import { ManipulaErros } from "../utils/manipulaErros";
import { EnumHttpStatusCode } from "../enum/EnumHttpStatusCode";

export const erroMiddleware = (
    erro:ManipulaErros,
    req: Request,
    res: Response,
    next: NextFunction) => {
        const statusCode = erro.statusCode??EnumHttpStatusCode.INTERNAL_SERVER_ERROR;
        const message = erro.statusCode? erro.message: "Erro interno do servidor";
        res.status(statusCode).json({ error: message });
        return next();
}

export class RequisicaoRuim extends ManipulaErros {
    constructor(message: string) {
        super(message, EnumHttpStatusCode.BAD_REQUEST);
    }
}

export class NaoEncontrado extends ManipulaErros {
    constructor(message: string) {
        super(message, EnumHttpStatusCode.NOT_FOUND);
    }
}
