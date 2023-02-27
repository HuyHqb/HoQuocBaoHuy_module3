package model.employee;

public class Position {
    private int id;
    private String type;

    public Position() {
    }

    public Position(int id, String type) {
        this.id = id;
        this.type = type;
    }

    public Position(int id) {
        this.id = id;
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
