package model.svc;

public class Service {
    private int id;
    private String name;
    private int area;
    private double rentPrice;
    private int maxPerson;
    private RentType rentType;
    private ServiceType serviceType;
    private String standard;
    private String otherServiceDescription;
    private double poolArea;
    private int floor;
    private String freeService;

    public Service() {
    }

    public Service(int id, String name, int area, double rentPrice, int maxPerson, RentType rentType, ServiceType serviceType, String standard, String otherServiceDescription, double poolArea, int floor, String freeService) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.rentPrice = rentPrice;
        this.maxPerson = maxPerson;
        this.rentType = rentType;
        this.serviceType = serviceType;
        this.standard = standard;
        this.otherServiceDescription = otherServiceDescription;
        this.poolArea = poolArea;
        this.floor = floor;
        this.freeService = freeService;
    }

    public Service( String name, int area, double rentPrice, int maxPerson, RentType rentType, ServiceType serviceType, String standard, String otherServiceDescription, double poolArea, int floor, String freeService) {
        this.name = name;
        this.area = area;
        this.rentPrice = rentPrice;
        this.maxPerson = maxPerson;
        this.rentType = rentType;
        this.serviceType = serviceType;
        this.standard = standard;
        this.otherServiceDescription = otherServiceDescription;
        this.poolArea = poolArea;
        this.floor = floor;
        this.freeService = freeService;
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

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public double getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(double rentPrice) {
        this.rentPrice = rentPrice;
    }

    public int getMaxPerson() {
        return maxPerson;
    }

    public void setMaxPerson(int maxPerson) {
        this.maxPerson = maxPerson;
    }

    public RentType getRentType() {
        return rentType;
    }

    public void setRentType(RentType rentType) {
        this.rentType = rentType;
    }

    public ServiceType getServiceType() {
        return serviceType;
    }

    public void setServiceType(ServiceType serviceType) {
        this.serviceType = serviceType;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public String getOtherServiceDescription() {
        return otherServiceDescription;
    }

    public void setOtherServiceDescription(String otherServiceDescription) {
        this.otherServiceDescription = otherServiceDescription;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public String getFreeService() {
        return freeService;
    }

    public void setFreeService(String freeService) {
        this.freeService = freeService;
    }
}
