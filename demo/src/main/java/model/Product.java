package model;

public class Product {
    private int productID;
    private String productName;
    private double price;
    private int quantity;
    private String color;
    private int categoryID;

    public Product(int productID, String productName, double price, int quantity, String color, int categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.categoryID = categoryID;
    }

    public Product(String productName, double price, int quantity, String color, int categoryID) {
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.categoryID = categoryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
}
