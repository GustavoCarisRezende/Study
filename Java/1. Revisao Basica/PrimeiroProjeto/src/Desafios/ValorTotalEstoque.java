package Desafios;

public class ValorTotalEstoque {
    public static void main(String[] args) {
        double precoProduto = 37.86;
        int quantidadeProdutos = 53;
        double valorTotalEstoque = precoProduto * quantidadeProdutos;
        System.out.printf("O valor unitário do produto é R$%.2f, tendo %d em estoque, totalizando R$%.2f",
                precoProduto, quantidadeProdutos, valorTotalEstoque);
    }
}
