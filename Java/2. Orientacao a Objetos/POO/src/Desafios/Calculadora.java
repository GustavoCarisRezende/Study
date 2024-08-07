package Desafios;

import java.util.Scanner;

public class Calculadora {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Informe um número: ");
        double numero = scanner.nextDouble();
        System.out.printf("O dobro do número %.2f é %.2f", numero, (numero * 2));
    }
}
