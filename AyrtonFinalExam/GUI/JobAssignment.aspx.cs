using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using AyrtonFinalExam.DAL;
using AyrtonFinalExam.BLL;

namespace AyrtonFinalExam.GUI
{
    public partial class JobAssignment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DropDownEmployees();
                DropDownJobs();
            }
        }

        private void DropDownEmployees()
        {
            var employees = EmployeeDB.GetAllRecords();

            var employeeFullName = employees.Select(e => new {
                EmployeeNumber = e.EmployeeNumber,
                FullName = e.FirstName + " " + e.LastName
            }).ToList();

            DropDownListEmployees.DataSource = employeeFullName;
            DropDownListEmployees.DataTextField = "FullName";
            DropDownListEmployees.DataValueField = "EmployeeNumber";
            DropDownListEmployees.DataBind();
        }

        private void DropDownJobs()
        {
            var projects = JobDB.GetAllRecords();
            DropDownListJobs.DataSource = projects;
            DropDownListJobs.DataTextField = "JobTitle";
            DropDownListJobs.DataValueField = "JobCode";
            DropDownListJobs.DataBind();
        }

        protected void AssignedDateSelection(object sender, EventArgs e)
        {
            TextBoxAssignedDate.Text = CalendarAssignedDate.SelectedDate.ToShortDateString();
        }

        protected void SubmissionDateSelection(object sender, EventArgs e)
        {
            TextBoxSubmittedDate.Text = CalendarSubmittedDate.SelectedDate.ToShortDateString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int employeeID = int.Parse(DropDownListEmployees.SelectedValue);
            string jobCode = DropDownListJobs.SelectedValue;
            DateTime assignedDate, submittedDate;

            if (!DateTime.TryParse(TextBoxAssignedDate.Text, out assignedDate) || !DateTime.TryParse(TextBoxSubmittedDate.Text, out submittedDate))
            {
                MessageBox.Show("Invalid Date Format.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (JobAssignmentDB.LimitJobsByEmployee(employeeID) >= 2)
            {
                MessageBox.Show("A employee cannot be assigned to more than 2 jobs.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            JobAssignments ja = new JobAssignments
            {
                EmployeeNumber = employeeID,
                JobCode = jobCode,
                AssignedDate = assignedDate,
                SubmittedDate = submittedDate
            };

            try
            {
                JobAssignmentDB.SaveProjectAssignment(ja);
                MessageBox.Show("The job was assigned successfully to the employee.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Unexpected Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        protected void ButtonListJobsByEmployee_Click(object sender, EventArgs e)
        {
            int employeeID = int.Parse(DropDownListEmployees.SelectedValue);

            var jobs = JobAssignmentDB.ListJobsByEmployee(employeeID);

            GridView1.DataSource = jobs;
            GridView1.DataBind();
        }

        protected void ButtonListEmployeesByJob_Click(object sender, EventArgs e)
        {
            string jobCode = DropDownListJobs.SelectedValue;

            var employees = JobAssignmentDB.ListEmployeesByJob(jobCode);

            GridView2.DataSource = employees;
            GridView2.DataBind();
        }
    }
}