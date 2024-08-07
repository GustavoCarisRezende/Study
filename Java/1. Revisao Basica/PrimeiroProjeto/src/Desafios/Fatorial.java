package Desafios;

import java.util.Scanner;

public class Fatorial {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Informe um número inteiro: ");
        int numero = scanner.nextInt();
        int fatorial = numero;

        for (int i = (numero-1); i > 0; i--) {
            fatorial*= i;
        }

        System.out.printf("O fatorial de %d é %d", numero, fatorial);
    }
}
