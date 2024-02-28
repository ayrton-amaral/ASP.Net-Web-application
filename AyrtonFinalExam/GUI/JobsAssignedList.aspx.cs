using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using AyrtonFinalExam.BLL;
using AyrtonFinalExam.DAL;

namespace AyrtonFinalExam.GUI
{
    public partial class JobsAssignedList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int empID = (int)Session["empID"];

                Employee employee = new Employee();

                employee = employee.SearchEmployee(empID);

                LabelEmployeeNumber.Text = employee.EmployeeNumber.ToString();
                LabelEmployeeName.Text = employee.FirstName.ToString() + " " + employee.LastName;

                JobAssignments ja = new JobAssignments();

                List<Job> listJ = ja.ListJobsByEmployee(empID);

                if (listJ.Count != 0)
                {
                    GridViewJobsAssigned.DataSource = listJ;
                    GridViewJobsAssigned.DataBind();
                }
                else
                {
                    MessageBox.Show("No job has been assigned to this employee yet.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}