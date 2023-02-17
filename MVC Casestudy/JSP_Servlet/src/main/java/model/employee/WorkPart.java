package model.employee;

public class WorkPart {
    private int id;
    private String type;

    public WorkPart() {
    }

    public WorkPart(int id, String type) {
        this.id = id;
        this.type = type;
    }

    public WorkPart(int id) {
        this.id=id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
