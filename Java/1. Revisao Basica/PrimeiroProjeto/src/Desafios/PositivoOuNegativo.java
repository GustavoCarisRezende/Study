package Desafios;

import java.util.Scanner;

public class PositivoOuNegativo {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Informe um número: ");
        double valor = scanner.nextDouble();

        if(valor >= 0)
            System.out.println("O valor informado é positivo!");
        else
            System.out.println("O valor informado é negativo!");
    }
}
