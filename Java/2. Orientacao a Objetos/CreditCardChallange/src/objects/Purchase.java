package objects;

import java.util.ArrayList;
import java.util.List;

public class Purchase {
    private List<Product> products;

    public Purchase() {
        products = new ArrayList<>();
    }

    public void addProduct(Product product) {
        this.products.add(product);
    }
}
