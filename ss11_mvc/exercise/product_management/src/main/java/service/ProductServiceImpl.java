package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements IProductService {
    private static Map<String, Product> products;

    static {
        products = new HashMap<>();
        products.put("1",new Product("1", "Orion", "2"));
        products.put("2",new Product("2", "O'star", "6"));
        products.put("3",new Product("3", "Oreo", "3"));
        products.put("4",new Product("4", "Cosy", "1"));
        products.put("5",new Product("5", "Cara", "2"));
    }

    @Override
    public List<Product> display() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getSku(),product);
    }

    @Override
    public Product findBySku(String sku) {
        return products.get(sku);
    }

    @Override
    public void remove(String sku) {
        products.remove(sku);
    }

    @Override
    public void update(String sku, Product product) {
        products.put(product.getSku(),product);
    }


}
