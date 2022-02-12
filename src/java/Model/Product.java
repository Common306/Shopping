package Model;

public class Product {
    private int productId;
    private String productName;
    private String image;
    private int unitCost;
    private String description;
    private Category category;

    public Product() {
    }

    public Product(int productId, String productName, String image, int unitCost, String description, Category category) {
        this.productId = productId;
        this.productName = productName;
        this.image = image;
        this.unitCost = unitCost;
        this.description = description;
        this.category = category;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getUnitCost() {
        return unitCost;
    }

    public void setUnitCost(int unitCost) {
        this.unitCost = unitCost;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    
}