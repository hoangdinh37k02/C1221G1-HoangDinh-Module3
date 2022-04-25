package repository.impl;

import model.Product;
import repository.BaseRepository;
import repository.IProductRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Product> selectAllProduct() {
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("select * from product");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int productID = rs.getInt("productID");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                int categoryID = rs.getInt("categoryID");

                productList.add(new Product(productID,productName,price,quantity,color,categoryID));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
}
