using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AyrtonFinalExam.DAL;

namespace AyrtonFinalExam.BLL
{
    public class JobAssignments
    {
        public int JobAssignmentID { get; set; }

        public int EmployeeNumber { get; set; }

        public string JobCode { get; set; }

        public DateTime AssignedDate { get; set; }

        public DateTime SubmittedDate { get; set; }

        public List<Job> ListJobsByEmployee(int empID) => JobAssignmentDB.ListJobsByEmployee(empID);
    }
}