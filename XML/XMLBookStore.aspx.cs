using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestiondeEstado
{
    public partial class XMLBookStore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        protected void btnGo_Click(object sender, EventArgs e)
        {
            string strCriterio;

            strCriterio = DropDownList1.SelectedValue.ToString();

            XmlDataSource1.XPath = "bookstore/book[@category='" + strCriterio + "']";
        }
    }
}