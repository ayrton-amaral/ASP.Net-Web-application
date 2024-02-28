using AyrtonFinalExam.BLL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Windows.Forms;

namespace AyrtonFinalExam.DAL
{
    public static class JobAssignmentDB
    {
        private static Random random = new Random();

        private static bool JobAssignmentIDExists(int id, SqlConnection conn)
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM JobAssignments WHERE JobAssignmentID = @JobAssignmentID", conn))
            {
                cmd.Parameters.AddWithValue("@JobAssignmentID", id);
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        private static int GenerateRandomJobAssignmentID(SqlConnection conn)
        {
            int id;
            bool isUnique;

            do
            {
                id = random.Next(1, 999999);
                isUnique = !JobAssignmentIDExists(id, conn);
            } while (!isUnique);

            return id;
        }

        public static List<Job> ListJobsByEmployee(int empID)
        {
            List<Job> listJ = new List<Job>();

            SqlConnection conn = UtilityDB.GetDBConnection();

            try
            {
                SqlCommand cmdJobsByEmployee = new SqlCommand("SELECT J.* FROM Jobs J " +
                                                             "JOIN JobAssignments JA ON J.JobCode = JA.JobCode " +
                                                             "WHERE EmployeeNumber=@EmployeeNumber", conn);

                cmdJobsByEmployee.Parameters.AddWithValue("@EmployeeNumber", empID);

                using (SqlDataReader reader = cmdJobsByEmployee.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Job job = new Job
                        {
                            JobCode = reader["JobCode"].ToString(),
                            JobTitle = reader["JobTitle"].ToString(),
                        };

                        listJ.Add(job);
                    }
                }
            }
            finally
            {
                conn.Close();
            }

            return listJ;
        }

        public static List<Employee> ListEmployeesByJob(string jCode)
        {
            List<Employee> listE = new List<Employee>();

            SqlConnection conn = UtilityDB.GetDBConnection();

            try
            {
                SqlCommand cmdEmployeesByJob = new SqlCommand("SELECT E.* FROM Employees E " +
                                                                 "JOIN JobAssignments JA ON E.EmployeeNumber = JA.EmployeeNumber " +
                                                                 "WHERE JA.JobCode = @JobCode", conn);

                cmdEmployeesByJob.Parameters.AddWithValue("@JobCode", jCode);

                using (SqlDataReader reader = cmdEmployeesByJob.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Employee employee = new Employee
                        {
                            EmployeeNumber = Convert.ToInt32(reader["EmployeeNumber"]),
                            FirstName = reader["FirstName"].ToString(),
                            LastName = reader["LastName"].ToString(),
                            Email = reader["Email"].ToString(),
                        };

                        listE.Add(employee);
                    }
                }
            }
            finally
            {
                conn.Close();
            }

            return listE;
        }

        public static void SaveProjectAssignment(JobAssignments ja)
        {
            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                int id = GenerateRandomJobAssignmentID(conn);

                if (!JobAssignmentIDExists(id, conn))
                {
                    // Proceed with insertion if the assignment does not exist
                    string query = "INSERT INTO JobAssignments (JobAssignmentID, EmployeeNumber, JobCode, AssignedDate, SubmittedDate) VALUES (@JobAssignmentID, @EmployeeNumber, @JobCode, @AssignedDate, @SubmittedDate)";

                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@JobAssignmentID", id);
                    cmd.Parameters.AddWithValue("@EmployeeNumber", ja.EmployeeNumber);
                    cmd.Parameters.AddWithValue("@JobCode", ja.JobCode);
                    cmd.Parameters.AddWithValue("@AssignedDate", ja.AssignedDate);
                    cmd.Parameters.AddWithValue("@SubmittedDate", ja.SubmittedDate);

                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, "Unexpected Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    MessageBox.Show("This job assignment was done already.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
        }

        public static int LimitJobsByEmployee(int empID)
        {
            int count = 0;

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM JobAssignments " +
                                                "WHERE EmployeeNumber = @EmployeeNumber", conn);

                cmd.Parameters.AddWithValue("@EmployeeNumber", empID);

                try
                {
                    count = (int)cmd.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Unexpected Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }

            return count;
        }
    }
}