package Desafios;

import java.util.Scanner;

public class Tabuada {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Informe um valor de [0 - 10]: ");
        int numero = scanner.nextInt();

        for (int i = 1; i < 11; i++) {
            System.out.printf("%d X %d = %d\n", i, numero, (i * numero));
        }
    }
}
