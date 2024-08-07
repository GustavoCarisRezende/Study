import { NextFunction, Request, Response } from "express";
import * as yup from "yup";
import EnderecoEntity from "../../entity/EnderecoEntity";
import { pt } from 'yup-locale-pt';

yup.setLocale(pt);

const esquemaBodyEndereco: yup.ObjectSchema<Omit<EnderecoEntity, "id">> = yup.object({
    cidade: yup.string().defined().required(),
    estado: yup.string().defined().required(),
});

const middlewareValidatorBodyEndereco = async (req: Request, res: Response, next: NextFunction) => {
    try {
        await esquemaBodyEndereco.validate(req.body, {abortEarly: false});
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

export { middlewareValidatorBodyEndereco };
