package Desafios;

import java.util.Scanner;

public class DoisNumeros {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Informe o primeiro valor:");
        double valor1 = scanner.nextDouble();

        System.out.println("Informe o segundo valor:");
        double valor2 = scanner.nextDouble();

        if(valor1 == valor2){
            System.out.println("Os valores informados são iguais!");
        } else {
            System.out.println("Os valores informados são diferentes!");
            if(valor1 > valor2)
                System.out.println("O primeiro valor é maior!");
            else
                System.out.println("O segundo valor é maior!");
        }
    }
}
