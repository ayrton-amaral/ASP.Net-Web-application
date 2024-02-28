using AyrtonFinalExam.BLL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Windows.Forms;

namespace AyrtonFinalExam.DAL
{
    public static class UserDB
    {
        public static User SearchRecord(int userID)
        {
            User user = null;

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmdSearch = new SqlCommand("SELECT * FROM Users WHERE UserCode=@UserCode", conn);
                cmdSearch.Parameters.AddWithValue("@UserCode", userID);

                try
                {
                    using (SqlDataReader reader = cmdSearch.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            user = new User()
                            {
                                UserCode = Convert.ToInt32(reader["UserCode"]),
                                Password = reader["Password"].ToString(),
                            };
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Unexpected Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            return user;
        }

    }
}