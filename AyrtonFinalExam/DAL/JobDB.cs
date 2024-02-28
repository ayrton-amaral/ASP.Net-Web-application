using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using AyrtonFinalExam.BLL;

namespace AyrtonFinalExam.DAL
{
    public static class JobDB
    {
        public static List<Job> GetAllRecords()
        {
            List<Job> listJ = new List<Job>();

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Jobs", conn);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Job job = new Job()
                        {
                            JobCode = reader["JobCode"].ToString(),
                            JobTitle = reader["JobTitle"].ToString(),
                        };

                        listJ.Add(job);
                    }
                }
            }

            return listJ;
        }
    }
}