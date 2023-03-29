package bean;

public class Employee {
    private int id;
    private String fullName;
    private String birthday;
    private String address;
    private String startDay;
    private String endDay;
    private float salary;
    private Job job;

    public Employee() {
    }

    public Employee(String fullName, String birthday, String address, String startDay, String endDay, float salary, Job job) {
        this.fullName = fullName;
        this.birthday = birthday;
        this.address = address;
        this.startDay = startDay;
        this.endDay = endDay;
        this.salary = salary;
        this.job = job;
    }

    public Employee(int id, String fullName, String birthday, String address, String startDay, String endDay, float salary, Job job) {
        this.id = id;
        this.fullName = fullName;
        this.birthday = birthday;
        this.address = address;
        this.startDay = startDay;
        this.endDay = endDay;
        this.salary = salary;
        this.job = job;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStartDay() {
        return startDay;
    }

    public void setStartDay(String startDay) {
        this.startDay = startDay;
    }

    public String getEndDay() {
        return endDay;
    }

    public void setEndDay(String endDay) {
        this.endDay = endDay;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }
}
