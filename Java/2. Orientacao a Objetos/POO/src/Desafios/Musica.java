package Desafios;

import java.util.Scanner;

public class Musica {
    String titulo;
    String artista;
    int anoLancamento;
    double avaliacao;
    int numeroAvaliacoes;

    public double calculaNotaMusica() {
        if(numeroAvaliacoes > 0)
            return avaliacao / numeroAvaliacoes;
        else
            return 0;
    }

    public void exibeFichaTecnica() {
        System.out.printf("""
                Título: %s
                Artista: %s
                Ano de Lançamento: %d
                Quantidade de avaliações: %d
                Média das avaliações: %.2f""", titulo, artista, anoLancamento, numeroAvaliacoes, calculaNotaMusica());
    }

    public void avaliaMusica() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Informe a nota para a música [0 - 10]: ");
        double nota = scanner.nextDouble();
        while(nota > 10 || nota < 0) {
            System.out.print("A avaliação precisa estar no intervalo de [0 - 10]: ");
            nota = scanner.nextDouble();
        }
        avaliacao += nota;
        numeroAvaliacoes++;
    }
}
