package Desafios;

public class ConversaoDolarParaReal {
    public static void main(String[] args) {
        double precoDolar = 14.99;
        double precoEmReal = precoDolar * 4.87;
        System.out.printf("O preço do produto em dólar é $%.2f, em real fica R$%.2f", precoDolar, precoEmReal);
    }
}
