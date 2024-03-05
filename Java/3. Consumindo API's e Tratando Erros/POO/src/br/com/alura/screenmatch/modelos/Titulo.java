package br.com.alura.screenmatch.modelos;

import br.com.alura.screenmatch.excecao.ErroDeConversaoDeAnoException;
import com.google.gson.annotations.SerializedName;

public class Titulo implements Comparable<Titulo>{

    @SerializedName("Title")
    private String nome;

    @SerializedName("Year")
    private int anoDeLancamento;

    private boolean incluidoNoPlano;
    private double somaDasAvaliacdoes;
    private int totalDeAvaliacoes;
    private int duracaoEmMinutos;

    public Titulo(TituloOmdb meuTituloOmbdb) {
        this.nome = meuTituloOmbdb.title();
        if(meuTituloOmbdb.year().length() > 4) {
            throw new ErroDeConversaoDeAnoException("Ano inválido!");
        } else {
            this.anoDeLancamento = Integer.valueOf(meuTituloOmbdb.year());
        }
        this.duracaoEmMinutos = Integer.valueOf(meuTituloOmbdb.runtime().substring(0, 2));
    }

    @Override
    public String toString() {
        return  "Nome: " + this.nome +
                " | Ano de lançamento: " + this.anoDeLancamento +
                " | Duração: " + this.duracaoEmMinutos;
    }

    public Titulo(String nome, int anoDeLancamento) {
        this.nome = nome;
        this.anoDeLancamento = anoDeLancamento;
    }

    @Override
    public int compareTo(Titulo outroTitulo) {
        return this.getNome().compareTo(outroTitulo.getNome());
    }

    public void exibeFichaTecnica() {
        System.out.printf("""
                Nome: %s
                Ano de lançamento: %d
                Avaliação: %.2f
                Duração (min): %d
                """, this.nome, this.anoDeLancamento, this.somaDasAvaliacdoes, this.duracaoEmMinutos);
    }

    public void avalia(double nota) {
        somaDasAvaliacdoes += nota;
        totalDeAvaliacoes++;
    }

    public double pegaMedia() {
        return somaDasAvaliacdoes / totalDeAvaliacoes;
    }

    public int getTotalDeAvaliacoes() {
        return totalDeAvaliacoes;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setAnoDeLancamento(int anoDeLancamento) {
        this.anoDeLancamento = anoDeLancamento;
    }

    public void setIncluidoNoPlano(boolean incluidoNoPlano) {
        this.incluidoNoPlano = incluidoNoPlano;
    }

    public void setDuracaoEmMinutos(int duracaoEmMinutos) {
        this.duracaoEmMinutos = duracaoEmMinutos;
    }

    public String getNome() {
        return nome;
    }

    public int getAnoDeLancamento() {
        return anoDeLancamento;
    }

    public boolean isIncluidoNoPlano() {
        return incluidoNoPlano;
    }

    public int getDuracaoEmMinutos() {
        return duracaoEmMinutos;
    }
}
