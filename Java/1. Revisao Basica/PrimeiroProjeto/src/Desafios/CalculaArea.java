package Desafios;

import java.util.Scanner;

public class CalculaArea {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String texto = """
                SELECIONE UMA DAS OPÇÕES ABAIXO:
                    [1] CALCULO DE ÁREA DE QUADRADO
                    [2] CÁLCULO DE ÁREA DE CÍRCULO
                """;
        System.out.println(texto);
        System.out.print("--> ");

        switch (scanner.nextInt()) {
            case 1 -> {
                System.out.print("Informe a medida do lado em cm: ");
                double ladoQuadrado = scanner.nextDouble();
                System.out.printf("A área do quadrado corresponde a %.2f cm²", (Math.pow(ladoQuadrado, 2)));
            }
            case 2 -> {
                System.out.print("Informe o raio do círculo em cm: ");
                double raioCirculo = scanner.nextDouble();
                System.out.printf("A área do círculo corresponde a %.2f cm²", (Math.PI * (Math.pow(raioCirculo, 2))));
            }
            default -> System.out.println("A opção selecionada é inválida!");
        }
    }
}
