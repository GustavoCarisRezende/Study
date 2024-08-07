import AdotanteEntity from "../../entity/AdotanteEntity";
import EnderecoEntity from "../../entity/EnderecoEntity";

export default interface InterfaceAdotanteRepository {
    criaAdotante(adotante: AdotanteEntity): void | Promise<void>;
    listaAdotante(): Array<AdotanteEntity> | Promise<AdotanteEntity[]>;
    atualizaAdotante(id: number, newData: AdotanteEntity): Promise<{ sucess: boolean, message?: string }> | void;
    deletaAdotante(id: number): Promise<{ sucess: boolean, message?: string }> | void;
    atualizaEnderecoAdotante(idAdotante: number, endereco: EnderecoEntity): Promise<{ sucess: boolean, message?: string }> | void;
}
