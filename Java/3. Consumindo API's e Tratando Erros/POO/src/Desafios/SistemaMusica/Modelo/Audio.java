package Desafios.SistemaMusica.Modelo;

public class Audio {
    private String titulo;
    private int reproducoes;
    private int curtidas;
    private int classificacao;

    public void curte() {
        this.curtidas++;
    }

    public void reproduz() {
        this.reproducoes++;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getReproducoes() {
        return reproducoes;
    }

    public int getCurtidas() {
        return curtidas;
    }

    public int getClassificacao() {
        return classificacao;
    }
}
