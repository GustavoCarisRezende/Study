import java.util.Scanner;

public class Loop {
    public static void main(String[] args) {
        Scanner leitura = new Scanner(System.in);
        double mediaAvaliacao = 0;

        for (int i = 0; i < 3; i++) {
            System.out.println("Informe a nota para o filme 0 - 10:");
            mediaAvaliacao += leitura.nextDouble();
        }

        System.out.printf("A média das avaliações é %.2f", (mediaAvaliacao / 3));
    }
}
