import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import entidades.ViaCep;
import servico.UserInterface;

import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        UserInterface ui = new UserInterface();
        Gson gson = new GsonBuilder()
                .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_DOTS)
                .setPrettyPrinting().disableHtmlEscaping().create();
        try {
            FileWriter writer = new FileWriter("json.txt");

            List<ViaCep> response = ui.interfaceUsuario();

            if(response.size() == 1) {
                writer.write(gson.toJson(response.get(0)));
            } else if (response.size() > 1) {
                writer.write(gson.toJson(response));
            } else {
                System.out.println("Informações não encontradas!");
            }

            writer.close();
        } catch (IOException | InterruptedException e) {
            System.out.println("Algo deu errado, Stacktrace:");
            e.printStackTrace();
        }
    }
}
