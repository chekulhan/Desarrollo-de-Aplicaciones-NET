using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsERPVuelos
{
    class ItemEjemplo
    {
        public string Text{ get; set; }
        public Object Value { get; set; }
        public ItemEjemplo(String c, int v)
        {
            Text = c;
            Value = v;
        }
        public override string ToString()
        {
            return Text;
        }
    }
}
