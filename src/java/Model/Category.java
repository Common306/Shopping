package Model;

public class Category {
    private int categoryId;
    private String categoryName;
    private int classifyId;

    public Category() {
    }

    public Category(int categoryId, String categoryName, int classifyId) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.classifyId = classifyId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(int classifyId) {
        this.classifyId = classifyId;
    }

    
    
    
    
}