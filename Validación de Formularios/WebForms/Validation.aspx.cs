using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class Validation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // asignar un valor al hidden textbox con fecha de ahora
            HiddenTodayDate.Text = DateTime.Today.ToShortDateString();

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                submitButton.Text = "Valid";
            }
            else
            {
                submitButton.Text = "Invalid!";
            }
        }
    }
}