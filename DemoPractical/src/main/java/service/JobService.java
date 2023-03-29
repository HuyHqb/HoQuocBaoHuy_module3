package service;

import bean.Job;
import repository.EmployeeRepo;
import repository.JobRepo;
import repository.impl.IEmployeeRepo;
import repository.impl.IJobRepo;
import service.impl.IJobService;

import java.util.List;

public class JobService implements IJobService {
    IJobRepo jobRepo = new JobRepo();
    @Override
    public List<Job> findAll() {
        return jobRepo.findAll();
    }
}
