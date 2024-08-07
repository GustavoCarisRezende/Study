import PetEntity from "../entity/PetEntity";

type TipoRequestBodyPet = Omit<PetEntity, "id">;

type TipoResponseBodyPet = { 
    dados?: 
        | Pick<PetEntity, "id" | "nome" | "especie" | "porte"> 
        | Pick<PetEntity, "id" | "nome" | "especie" | "porte">[],
    erros?: unknown
};

type TipoRequestParamsPet = { id?: string, pet_id?: string, id_adotante?: string };

export {
    TipoRequestBodyPet,
    TipoResponseBodyPet ,
    TipoRequestParamsPet
};
