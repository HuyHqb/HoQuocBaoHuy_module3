package model.employee;

public class Employee {
    private int id;
    private String name;
    private String birthday;
    private String cardId;
    private double salary;
    private String phoneNumber;
    private String email;
    private String address;
    private Position position;
    private Level level;
    private WorkPart workPart;

    public Employee() {
    }

    public Employee(int id, String name, String birthday, String cardId, double salary, String phoneNumber, String email, String address, Position position, Level level, WorkPart workPart) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.cardId = cardId;
        this.salary = salary;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.position = position;
        this.level = level;
        this.workPart = workPart;
    }

    public Employee( String name, String birthday, String cardId, double salary, String phoneNumber, String email, String address, Position position, Level level, WorkPart workPart) {
        this.name = name;
        this.birthday = birthday;
        this.cardId = cardId;
        this.salary = salary;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.position = position;
        this.level = level;
        this.workPart = workPart;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public WorkPart getWorkPart() {
        return workPart;
    }

    public void setWorkPart(WorkPart workPart) {
        this.workPart = workPart;
    }
}
