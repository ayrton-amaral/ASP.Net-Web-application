using AyrtonFinalExam.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AyrtonFinalExam.BLL
{
    public class User
    {
        public int UserCode { get; set; }

        public string Password { get; set; }

        public Employee SearchEmployee(int empID) => EmployeeDB.SearchRecord(empID);
    }
}