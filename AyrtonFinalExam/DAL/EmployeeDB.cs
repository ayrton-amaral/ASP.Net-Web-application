using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Windows.Forms;
using AyrtonFinalExam.BLL;

namespace AyrtonFinalExam.DAL
{
    public static class EmployeeDB
    {
        public static Employee SearchRecord(int empID)
        {
            Employee employee = null;

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmdSearch = new SqlCommand("SELECT * FROM Employees WHERE EmployeeNumber=@EmployeeNumber", conn);
                cmdSearch.Parameters.AddWithValue("@EmployeeNumber", empID);

                try
                {
                    using (SqlDataReader reader = cmdSearch.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            employee = new Employee()
                            {
                                EmployeeNumber = Convert.ToInt32(reader["EmployeeNumber"]),
                                FirstName = reader["FirstName"].ToString(),
                                LastName = reader["LastName"].ToString(),
                                Email = reader["Email"].ToString()
                            };
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Unexpected Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    conn.Close();
                }
            }

            return employee;
        }

        public static List<Employee> GetAllRecords()
        {
            List<Employee> listE = new List<Employee>();

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Employees", conn);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Employee employee = new Employee()
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

            return listE;
        }
    }
}