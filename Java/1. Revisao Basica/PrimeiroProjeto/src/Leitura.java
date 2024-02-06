import java.util.Scanner;

public class Leitura {
    public static void main(String[] args) {
        Scanner leitura = new Scanner(System.in);

        System.out.println("Digite seu filme favorito:");
        String filme = leitura.nextLine();

        System.out.println("Informe o ano de lançamento:");
        int anoLancamento = leitura.nextInt();

        System.out.println("Informe a nota para o filme 0 - 10:");
        double avaliacao = leitura.nextDouble();

        System.out.printf("Seu filme favorito é %s do ano %d, sua nota para o filme é %.2f",
                filme, anoLancamento, avaliacao);
    }
}
