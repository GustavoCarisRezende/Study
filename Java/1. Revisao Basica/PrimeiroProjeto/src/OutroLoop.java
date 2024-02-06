import java.util.Scanner;

public class OutroLoop {
    public static void main(String[] args) {
        Scanner leitura = new Scanner(System.in);
        double mediaAvaliacao = 0;
        double nota = 0;
        int totalNotas = 0;

        while (nota != -1) {
            System.out.println("Informe a nota para o filme [0 - 10] ou [-1] para encerrar:");
            nota = leitura.nextDouble();
            if(nota != -1) {
                mediaAvaliacao += nota;
                totalNotas++;
            }
        }

        if(totalNotas > 0)
            System.out.printf("A média das avaliações é %.2f", (mediaAvaliacao / totalNotas));
        else
            System.out.println("Não foi informada nenhuma nota para calcular a média!");
    }
}
