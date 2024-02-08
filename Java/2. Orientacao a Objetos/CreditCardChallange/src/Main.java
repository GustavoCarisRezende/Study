import objects.CreditCard;
import objects.Product;
import objects.Purchase;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        Purchase purchase = new Purchase();
        var nextPurchase = 1;

        System.out.println("Desafio: aplicação de compras.");
        System.out.print("Informe o limite do cartão de crédito: ");
        CreditCard creditCard = new CreditCard(scanner.nextDouble());

        while(nextPurchase == 1) {
            System.out.print("Digite a descrição da compra: ");
            var productName = scanner.next();

            System.out.print("Digite o valor da compra: ");
            var productPrice = scanner.nextDouble();

            if(purchase.computeTotalPurchaseValue() + productPrice > creditCard.getLimit()) {
                System.out.println("Saldo insuficiente!");
                nextPurchase = 0;
            } else {
                purchase.addProduct(new Product(productName, productPrice));

                System.out.print("""
                    Compra realizada!
                    Digite 0 para sair ou 1 para continuar
                    -> """);

                nextPurchase = scanner.nextInt();
            }
        }
        purchase.getPurchaseDetails();
        System.out.println("Saldo do cartão: " + (creditCard.getLimit() - purchase.computeTotalPurchaseValue()));
    }
}