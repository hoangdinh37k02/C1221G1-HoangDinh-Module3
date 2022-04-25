package model;

public class Category {
    private int productID;
    private String name;

    public Category(int productID, String name) {
        this.productID = productID;
        this.name = name;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
