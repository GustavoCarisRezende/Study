public class Main {
    public static void main(String[] args) {
        System.out.println("Esse é o Screen Match");
        System.out.println("Filme: Top Gun: Maverick");

        // Camel Casing
        int anoDeLancamento = 2022;
        System.out.println("Ano de lançamento: " + anoDeLancamento);

        boolean incluidoNoPlano = true;
        double notaDoFilme = 8.1;

        // Precedência - Ordem do que será executado primeiro
        // Média calculada pelas 3 notas dos avaliadores
        double media = (9.8 + 6.3 + 8) / 3;
        System.out.println("Média das notas: " + media);

        String sinopse = """
                Filme Top Gun
                Filme de aventura com galã dos anos 80
                Muito bom!
                Ano de lançamento:""" + anoDeLancamento;
        System.out.println(sinopse);

        // Cast explícito
        int classificacao = (int) (media / 2);;
        System.out.println("Classificação: " + classificacao);
    }
}
