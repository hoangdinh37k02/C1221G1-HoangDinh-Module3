package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> display();

    void save(Product product);

    Product findBySku(String sku);

    void remove(String sku);

    void update(String sku, Product product);
}
