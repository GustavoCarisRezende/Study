package br.com.alura.screenmatch.principal;

import br.com.alura.screenmatch.excecao.ErroDeConversaoDeAnoException;
import br.com.alura.screenmatch.modelos.Titulo;
import br.com.alura.screenmatch.modelos.TituloOmdb;
import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.FileWriter;
import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class PrincipalComRepeticao {

    private static final String apiKey = "f32d44fa";

    public static void main(String[] args) throws IOException, InterruptedException {
        Scanner scanner = new Scanner(System.in);
        Gson gson = new GsonBuilder()
                .setFieldNamingPolicy(FieldNamingPolicy.UPPER_CAMEL_CASE)
                .setPrettyPrinting().create();
        List<Titulo> titulos = new ArrayList<>();
        var resposta = "";

        while(!resposta.trim().equalsIgnoreCase("SAIR")) {
            System.out.println("Digite o nome do filme ou SAIR para encerrar o programa: ");
            System.out.print("-> ");
            resposta = scanner.nextLine();

            // Encerra a aplicação
            if(resposta.trim().equalsIgnoreCase("SAIR")) {
                break;
            }

            try {
                HttpClient client = HttpClient.newHttpClient();
                HttpRequest request = HttpRequest.newBuilder()
                        .uri(URI.create("https://www.omdbapi.com/?t=" + URLEncoder.encode(resposta) + "&apikey=" + apiKey))
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

                TituloOmdb meuTituloOmbdb = gson.fromJson(response.body(), TituloOmdb.class);
                titulos.add(new Titulo(meuTituloOmbdb));

            } catch (NumberFormatException e) {
                System.out.println("Aconteceu um erro!");
                System.out.println(e.getMessage());
            } catch (IllegalArgumentException e) {
                System.out.println("Verifique a URL informada!");
                System.out.println(e.getMessage());
            } catch (ErroDeConversaoDeAnoException e) {
                System.out.println(e.getMessage());
            }
        }
        System.out.println(titulos);

        FileWriter escrita = new FileWriter("filmes.json");
        escrita.write(gson.toJson(titulos));
        escrita.close();

    }
}
