using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace WindowsFormsApp1
{
    public partial class Ficheros : Form
    {
        public Ficheros()
        {
            InitializeComponent();
        }

        private void Button1_Click(object sender, EventArgs e)
        {

            string linea;

            OpenFileDialog file = new OpenFileDialog();
            file.Filter= "txt files (*.txt)|*.txt|All files (*.*)|*.*";
            if (file.ShowDialog() == DialogResult.OK)
            {
                txtFile.Text = file.FileName;

                using (StreamReader sr = new StreamReader(txtFile.Text))
                {
                    while ((linea = sr.ReadLine()) != null)
                    {
                        txtContent.AppendText(linea);
                        txtContent.AppendText("\n");
                    }

                }
            }

        }


       
    }
}
