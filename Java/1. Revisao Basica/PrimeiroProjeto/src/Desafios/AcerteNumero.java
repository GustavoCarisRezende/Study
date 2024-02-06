package Desafios;

import java.util.Random;
import java.util.Scanner;

public class AcerteNumero {
    public static void main(String[] args) {
        Scanner leitura = new Scanner(System.in);

        int valorSorteado = new Random().nextInt(100);
        int tentativasRestantes = 5;

        while(tentativasRestantes > 0) {
            System.out.println("Informe um número de 0 - 100: ");
            int numero = leitura.nextInt();

            if(numero == valorSorteado) {
                System.out.printf("\nPARABÉNS! Você acertou! O valor era %d\n", valorSorteado);
                break;
            } else {
                if(numero > valorSorteado){
                    System.out.println("O valor informado é maior que o número sorteado!");
                } else {
                    System.out.println("O valor informado é menor que o número sorteado!");
                }
                tentativasRestantes--;
                System.out.printf("\nRestam %d tentativas!\n", tentativasRestantes);
            }
        }

        if(tentativasRestantes == 0) {
            System.out.printf("\nVocê não conseguiu adivinhar o número sorteado, que era o %d, boa sorte na próxima!\n",
                    valorSorteado);
        }
    }
}
