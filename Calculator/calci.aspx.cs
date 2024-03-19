using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Calculator
{
    public partial class calci : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              
        }

        protected void Calculate(object sender, EventArgs e)
        {
            try
            {
                double number1 = Convert.ToDouble(tnum1.Text);
                double number2 = Convert.ToDouble(tnum2.Text);
                double result = 0;

                // Now extracting the type of button tapped using the sender argument.

                Button clicked = (Button)sender;
                string ch = clicked.Text;

                switch (ch)
                {
                    case "+":
                        result = number1 + number2;
                        break;

                    case "-":
                        result = number1 - number2;
                        break;

                    case "*":
                        result = number1 * number2;
                        break;

                    case "/":
                        result = number1 / number2;
                        break;

                    case "%":
                        result = number1 % number2;
                        break;

                    default:
                        tresult.Text = "Invalid Input";
                        break;
                }
                //Assigning the result.
                tresult.Text = result.ToString();
            }

             catch (FormatException)
            {
                tresult.Text = "Incorrect input format";
            }
        }
    }
}