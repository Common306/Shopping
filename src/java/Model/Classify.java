package Model;

public class Classify {
    private int classifyId;
    private String classifyName;

    public Classify() {
    }

    public Classify(int classifyId, String classifyName) {
        this.classifyId = classifyId;
        this.classifyName = classifyName;
    }

    public int getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(int classifyId) {
        this.classifyId = classifyId;
    }

    public String getClassifyName() {
        return classifyName;
    }

    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }
    
}