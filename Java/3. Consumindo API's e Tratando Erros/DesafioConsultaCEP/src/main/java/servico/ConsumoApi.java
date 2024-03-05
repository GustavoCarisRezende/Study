package servico;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import entidades.ViaCep;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class ConsumoApi {

    private static final String baseUrl = "https://viacep.com.br/ws/";
    private final Gson gson = new GsonBuilder()
            .setFieldNamingPolicy(FieldNamingPolicy.UPPER_CAMEL_CASE)
            .setPrettyPrinting().create();
    private HttpClient client = HttpClient.newHttpClient();
    private HttpRequest request;
    private HttpResponse<String> response;


    public ViaCep consultaCep(String cep) throws IOException, InterruptedException {
        request = HttpRequest.newBuilder()
                .uri(URI.create(baseUrl + cep + "/json"))
                .build();
        response = client.send(request, HttpResponse.BodyHandlers.ofString());

        return gson.fromJson(response.body(), ViaCep.class);
    }

    public ViaCep descobreCep(String uf, String cidade, String logradouro) {

    }

}
