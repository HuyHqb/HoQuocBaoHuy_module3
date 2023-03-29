package repository;

import bean.Job;
import repository.impl.IJobRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JobRepo implements IJobRepo {
    @Override
    public List<Job> findAll() {
        List<Job> jobList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from job");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int jobId = resultSet.getInt("job_id");
                String jobName = resultSet.getString("job_name");
                float minSalary = resultSet.getFloat("min_salary");
                float maxSalary = resultSet.getFloat("max_salary");
                Job job = new Job(jobId,jobName,minSalary,maxSalary);
                jobList.add(job);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return jobList;
    }
}
