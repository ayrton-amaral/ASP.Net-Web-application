using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Windows.Forms;
using AyrtonFinalExam.BLL;
using AyrtonFinalExam.DAL;
using AyrtonFinalExam.VALIDATION;
using System.ComponentModel.DataAnnotations;

namespace AyrtonFinalExam.GUI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            int userCode;
            string password = TextBoxPassword.Text;

            if (!int.TryParse(TextBoxUserCode.Text, out userCode))
            {
                MessageBox.Show("Username must contain only numbers.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                return;
            }

            if (!Validation.IsValidUserCode(TextBoxUserCode.Text))
            {
                MessageBox.Show("User Code must contain 5 numerical digits.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                
                return;
            }

            User user = UserDB.SearchRecord(userCode);

            if (userCode == 44444 && password == "David44444")
            {
                Response.Redirect("JobAssignment.aspx");
                return;
            }

            if (user != null && (user.Password).ToUpper() == TextBoxPassword.Text.ToUpper())
            {
                Session["empID"] = userCode;

                Response.Redirect("JobsAssignedList.aspx");
            }
            else
            {
                MessageBox.Show("Invalid Username or Password!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}