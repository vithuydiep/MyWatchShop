package model;

public class Product {
    private long productID;
    private long categoryID;
    private String productName;
    private long brandID;
    private String productImage;
    private String productImageForward;
    private String productImageBack;
    private long productPrice;
    private String productDescription;
    private int amount;
    private int state;
    private int current;

  

    public Product() {
        
    }

    public Product(long productID, long categoryID, String productName, long brandID, String productImage, String productImageForward, String productImageBack, long productPrice, String productDescription, int amount, int state, int current) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.brandID = brandID;
        this.productImage = productImage;
        this.productImageForward = productImageForward;
        this.productImageBack = productImageBack;
        this.productPrice = productPrice;
        this.productDescription = productDescription;
        this.amount = amount;
        this.state = state;
        this.current = current;
    }



   

    public Product(long productID, long categoryID, String productName, long brandID, String productImage, String productImageForward, String productImageBack, long productPrice, String productDescription) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.brandID = brandID;
        this.productImage = productImage;
        this.productImageForward = productImageForward;
        this.productImageBack = productImageBack;
        this.productPrice = productPrice;
        this.productDescription = productDescription;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

  
    public long getProductID() {
        return productID;
    }

    public void setProductID(long productID) {
        this.productID = productID;
    }

    public long getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(long categoryID) {
        this.categoryID = categoryID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public long getBrandID() {
        return brandID;
    }

    public void setBrandID(long brandID) {
        this.brandID = brandID;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getProductImageForward() {
        return productImageForward;
    }

    public void setProductImageForward(String productImageForward) {
        this.productImageForward = productImageForward;
    }

    public String getProductImageBack() {
        return productImageBack;
    }

    public void setProductImageBack(String productImageBack) {
        this.productImageBack = productImageBack;
    }

    public long getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(long productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    
    
    
}
