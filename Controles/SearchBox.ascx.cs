using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Controles
{
    public partial class SearchBox : System.Web.UI.UserControl
    {
        public string defaultText { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtSearch.Text = defaultText;
        }
    }
}