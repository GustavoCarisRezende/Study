package Desafios;

import java.util.Scanner;

public class ImPar {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Informe um número inteiro: ");
        int numero = scanner.nextInt();

        if(numero % 2 == 0)
            System.out.println("O número informado é PAR!");
        else
            System.out.println("O número informado é IMPAR!");
    }
}
