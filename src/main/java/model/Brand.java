package model;

public class Brand {
    private long brandID;
    private String brandName;
    
    public Brand(){
        
    }

    public Brand(long brandID, String brandName) {
        this.brandID = brandID;
        this.brandName = brandName;
    }

    public long getBrandID() {
        return brandID;
    }

    public void setBrandID(long brandID) {
        this.brandID = brandID;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
    
}
