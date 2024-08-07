import express from 'express';
import petRouter from './PetRouter';
import adotanteRouter from './AdotanteRoutes';

const router = (app:express.Router) => {
    app.use("/pets", petRouter);
    app.use("/adotantes", adotanteRouter);
};

export default router;
