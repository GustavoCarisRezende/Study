package objects;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Purchase {
    private List<Product> products;

    public Purchase() {
        products = new ArrayList<>();
    }

    public void addProduct(Product product) {
        this.products.add(product);
    }

    public double computeTotalPurchaseValue() {
        var totalPurchaseValue = 0;
        for(Product product : products) {
            totalPurchaseValue += product.getPrice();
        }
        return totalPurchaseValue;
    }

    public void getPurchaseDetails() {
        Collections.sort(products);
        System.out.println("COMPRAS REALIZADAS:");
        for(Product product : products) {
            System.out.println(product.getName() + " - R$" + product.getPrice());
        }
    }
}
