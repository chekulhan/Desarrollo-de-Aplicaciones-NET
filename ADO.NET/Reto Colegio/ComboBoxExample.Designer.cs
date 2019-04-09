namespace WindowsFormsERPVuelos
{
    partial class ComboBoxExample
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cboEmpleados = new System.Windows.Forms.ComboBox();
            this.btnBindCombo = new System.Windows.Forms.Button();
            this.btnBindCombo2 = new System.Windows.Forms.Button();
            this.cboEmpleados2 = new System.Windows.Forms.ComboBox();
            this.btnBindComboSQLReader = new System.Windows.Forms.Button();
            this.cboEmpleados3 = new System.Windows.Forms.ComboBox();
            this.btnSQLDataReader2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.btnReader3 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // cboEmpleados
            // 
            this.cboEmpleados.FormattingEnabled = true;
            this.cboEmpleados.Location = new System.Drawing.Point(32, 38);
            this.cboEmpleados.Name = "cboEmpleados";
            this.cboEmpleados.Size = new System.Drawing.Size(195, 21);
            this.cboEmpleados.TabIndex = 0;
            this.cboEmpleados.SelectedIndexChanged += new System.EventHandler(this.cboEmpleados_SelectedIndexChanged);
            // 
            // btnBindCombo
            // 
            this.btnBindCombo.Location = new System.Drawing.Point(190, 66);
            this.btnBindCombo.Name = "btnBindCombo";
            this.btnBindCombo.Size = new System.Drawing.Size(82, 25);
            this.btnBindCombo.TabIndex = 3;
            this.btnBindCombo.Text = "Bind Combo con base de datos";
            this.btnBindCombo.UseVisualStyleBackColor = true;
            this.btnBindCombo.Click += new System.EventHandler(this.btnBindCombo_Click);
            // 
            // btnBindCombo2
            // 
            this.btnBindCombo2.Location = new System.Drawing.Point(190, 110);
            this.btnBindCombo2.Name = "btnBindCombo2";
            this.btnBindCombo2.Size = new System.Drawing.Size(82, 42);
            this.btnBindCombo2.TabIndex = 4;
            this.btnBindCombo2.Text = "Bind Combo Dict, List";
            this.btnBindCombo2.UseVisualStyleBackColor = true;
            this.btnBindCombo2.Click += new System.EventHandler(this.btnBindCombo2_Click);
            // 
            // cboEmpleados2
            // 
            this.cboEmpleados2.FormattingEnabled = true;
            this.cboEmpleados2.Location = new System.Drawing.Point(31, 96);
            this.cboEmpleados2.Name = "cboEmpleados2";
            this.cboEmpleados2.Size = new System.Drawing.Size(121, 21);
            this.cboEmpleados2.TabIndex = 5;
            this.cboEmpleados2.SelectedIndexChanged += new System.EventHandler(this.cboEmpleados2_SelectedIndexChanged);
            // 
            // btnBindComboSQLReader
            // 
            this.btnBindComboSQLReader.Location = new System.Drawing.Point(190, 181);
            this.btnBindComboSQLReader.Name = "btnBindComboSQLReader";
            this.btnBindComboSQLReader.Size = new System.Drawing.Size(82, 45);
            this.btnBindComboSQLReader.TabIndex = 6;
            this.btnBindComboSQLReader.Text = "Bind Combo Data Reader";
            this.btnBindComboSQLReader.UseVisualStyleBackColor = true;
            this.btnBindComboSQLReader.Click += new System.EventHandler(this.btnBindComboSQLReader_Click);
            // 
            // cboEmpleados3
            // 
            this.cboEmpleados3.FormattingEnabled = true;
            this.cboEmpleados3.Location = new System.Drawing.Point(31, 181);
            this.cboEmpleados3.Name = "cboEmpleados3";
            this.cboEmpleados3.Size = new System.Drawing.Size(153, 21);
            this.cboEmpleados3.TabIndex = 7;
            this.cboEmpleados3.SelectedIndexChanged += new System.EventHandler(this.cboEmpleados3_SelectedIndexChanged);
            // 
            // btnSQLDataReader2
            // 
            this.btnSQLDataReader2.Location = new System.Drawing.Point(190, 226);
            this.btnSQLDataReader2.Name = "btnSQLDataReader2";
            this.btnSQLDataReader2.Size = new System.Drawing.Size(75, 34);
            this.btnSQLDataReader2.TabIndex = 8;
            this.btnSQLDataReader2.Text = "Data Reader 2";
            this.btnSQLDataReader2.UseVisualStyleBackColor = true;
            this.btnSQLDataReader2.Click += new System.EventHandler(this.btnSQLDataReader2_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(31, 226);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 9;
            this.button1.Text = "button1";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnReader3
            // 
            this.btnReader3.Location = new System.Drawing.Point(113, 226);
            this.btnReader3.Name = "btnReader3";
            this.btnReader3.Size = new System.Drawing.Size(75, 23);
            this.btnReader3.TabIndex = 10;
            this.btnReader3.Text = "Reader 3";
            this.btnReader3.UseVisualStyleBackColor = true;
            this.btnReader3.Click += new System.EventHandler(this.btnReader3_Click);
            // 
            // ComboBoxExample
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.btnReader3);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.btnSQLDataReader2);
            this.Controls.Add(this.cboEmpleados3);
            this.Controls.Add(this.btnBindComboSQLReader);
            this.Controls.Add(this.cboEmpleados2);
            this.Controls.Add(this.btnBindCombo2);
            this.Controls.Add(this.btnBindCombo);
            this.Controls.Add(this.cboEmpleados);
            this.Name = "ComboBoxExample";
            this.Text = "ComboBoxExample";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ComboBox cboEmpleados;
        private System.Windows.Forms.Button btnBindCombo;
        private System.Windows.Forms.Button btnBindCombo2;
        private System.Windows.Forms.ComboBox cboEmpleados2;
        private System.Windows.Forms.Button btnBindComboSQLReader;
        private System.Windows.Forms.ComboBox cboEmpleados3;
        private System.Windows.Forms.Button btnSQLDataReader2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btnReader3;
    }
}