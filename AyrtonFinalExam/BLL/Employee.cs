using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AyrtonFinalExam.DAL;

namespace AyrtonFinalExam.BLL
{
    public class Employee
    {
        public int EmployeeNumber { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public Employee SearchEmployee (int empID) => EmployeeDB.SearchRecord(empID);
    }
}