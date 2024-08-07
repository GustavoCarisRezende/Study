package servico;

import entidades.DadosEndereco;
import entidades.ViaCep;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class UserInterface {

    private final Scanner scanner = new Scanner(System.in);
    private ConsumoApi consumoApi = new ConsumoApi();

    public List<ViaCep> interfaceUsuario() throws IOException, InterruptedException {
        List<ViaCep> response = new ArrayList<>();
        switch (menu()) {
            case 0:
                String cep = buscaCep();
                response.add(consumoApi.consultaCep(cep));
                break;
            case 1:
                DadosEndereco dadosEndereco = descobreCep();
                response.addAll(Arrays.asList(consumoApi.descobreCep
                        (dadosEndereco.uf(), dadosEndereco.cidade(), dadosEndereco.rua())));
                break;
            default:
                System.out.println("Opção selecionada inválida!");
                break;
        }
        return response;
    }

    private int menu() {
        System.out.print("""
                Informe a operação a ser realizada:
                    [0] Buscar endereço com CEP
                    [1] Descobrir o CEP do endereço
        --> """);
        return scanner.nextInt();
    }

    private String buscaCep() {
        var cepValido = true;
        String cep = "";

        while (cepValido) {
            System.out.print("Informe o CEP para consulta (o [-] é opcional): ");
            cep = scanner.next();

            if(cep.replace("-", "").trim().length() != 8) {
                System.out.println("O CEP precisa contér 8 carácteres numéricos.");
            } else {
                cepValido = false;
            }
        }

        return cep.replace("-", "");
    }

    private DadosEndereco descobreCep() {
        String uf, rua, cidade = "";

        System.out.print("Informe o estado (UF): ");
        uf = scanner.next();

        System.out.print("Informe o nome da cidade: ");
        cidade = scanner.next();

        System.out.print("Informe o nome da rua: ");
        rua = scanner.next();

        return new DadosEndereco(uf, cidade, rua);
    }
}
