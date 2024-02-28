using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace AyrtonFinalExam.VALIDATION
{
    public static class Validation
    {
        public static bool IsValidUserCode(string input)
        {
            if (!Regex.IsMatch(input, @"^\d{5}$"))
            {
                return false;
            }

            return true;
        }
    }
}