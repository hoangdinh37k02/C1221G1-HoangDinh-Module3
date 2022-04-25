package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepositoryImpl;
import service.IProductService;

import java.util.List;

public class ProductServiceImpl implements IProductService {
    IProductRepository productRepository = new ProductRepositoryImpl();
    @Override
    public List<Product> selectAllProduct() {
        return productRepository.selectAllProduct();
    }
}
