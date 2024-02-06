package Desafios;

public class Desconto {
    public static void main(String[] args) {
        double precoOriginal = 15.89;
        double percentualDesconto = 10;
        double valorDesconto = (precoOriginal * (percentualDesconto / 100));
        double valorFinal = precoOriginal - valorDesconto;
        String mensagem = """
                Preço original do produto: R$%.2f
                Percentual de desconto: %.2f
                Valor do desconto: R$%.2f
                Valor final: R$%.2f
                """;
        System.out.printf(mensagem, precoOriginal, percentualDesconto, valorDesconto, valorFinal);
    }
}
