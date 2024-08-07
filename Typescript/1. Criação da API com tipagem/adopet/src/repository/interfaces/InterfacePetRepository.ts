import PetEntity from "../../entity/PetEntity";
import EnumPorte from "../../enum/EnumPorte";

export default interface InterfacePetRepository {
    criaPet(pet: PetEntity): Promise<void>;
    listaPet(): Array<PetEntity> | Promise<Array<PetEntity>>;
    atualizaPet(id: number, newData: PetEntity): Promise<{ sucess: boolean, message?: string }> | void;
    deletaPet(id: number): Promise<{ sucess: boolean, message?: string }> | void;
    adotaPet(idPet: number, idAdotante: number) : Promise<{ sucess: boolean, message?: string } | void>;
    buscaPetPorCampoGenerico<Tipo extends keyof PetEntity>(campo: Tipo, valor: PetEntity[Tipo]): Promise<PetEntity[]> | PetEntity[];
}
