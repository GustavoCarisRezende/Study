import { NextFunction, Request, Response } from "express";
import * as yup from "yup";
import { TipoRequestBodyAdotante } from "../../tipos/tiposAdotante";
import { pt } from 'yup-locale-pt';

yup.setLocale(pt);

const esquemaBodyAdotante: yup.ObjectSchema<Omit<TipoRequestBodyAdotante, "endereco">> = yup.object({
    nome: yup.string().defined().required(),
    senha: yup.string().defined().required().matches(/^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,16}$/gm, "senha fraca"),
    celular: yup.string().defined().required().matches(/^(\(?[0-9]{2}\)?)? ?([0-9]{4,5})-?([0-9]{4})$/gm, "celular inválido"),
    foto: yup.string().optional(),
    
});

const middlewareValidatorBodyAdotante = async (req: Request, res: Response, next: NextFunction) => {
    try {
        await esquemaBodyAdotante.validate(req.body, {abortEarly: false});
        return next();
    } catch(error) {
        const yupErrors = error as yup.ValidationError;
        const validationError: Record<string, string> = {};
        yupErrors.inner.forEach((erro) => {
            if(!erro.path) return;
            validationError[erro.path] = erro.message;
        });
        return res.status(400).json({ error: validationError });
    }
};

export { middlewareValidatorBodyAdotante };
