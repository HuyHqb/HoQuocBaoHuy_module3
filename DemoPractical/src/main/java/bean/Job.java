package bean;

public class Job {
    private int jobId;
    private String jobName;
    private float minSalary;
    private float maxSalary;

    public Job() {
    }

    public Job(int jobId, String jobName, float minSalary, float maxSalary) {
        this.jobId = jobId;
        this.jobName = jobName;
        this.minSalary = minSalary;
        this.maxSalary = maxSalary;
    }

    public Job(int jobId) {
        this.jobId = jobId;
    }

    public Job(String jobName, float minSalary, float maxSalary) {
        this.jobName = jobName;
        this.minSalary = minSalary;
        this.maxSalary = maxSalary;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public float getMinSalary() {
        return minSalary;
    }

    public void setMinSalary(int minSalary) {
        this.minSalary = minSalary;
    }

    public float getMaxSalary() {
        return maxSalary;
    }

    public void setMaxSalary(int maxSalary) {
        this.maxSalary = maxSalary;
    }
}
