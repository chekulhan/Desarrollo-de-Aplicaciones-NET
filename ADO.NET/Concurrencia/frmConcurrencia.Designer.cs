namespace WindowsFormsERPVuelos
{
    partial class frmConcurrencia
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
            this.dataGridProfesores = new System.Windows.Forms.DataGridView();
            this.button1 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.btnActualizar = new System.Windows.Forms.Button();
            this.txtProfesorID = new System.Windows.Forms.TextBox();
            this.txtCiudad = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.btnActualizarconConcurrencia = new System.Windows.Forms.Button();
            this.btnTimeStamp = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridProfesores)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridProfesores
            // 
            this.dataGridProfesores.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridProfesores.Location = new System.Drawing.Point(45, 99);
            this.dataGridProfesores.Name = "dataGridProfesores";
            this.dataGridProfesores.Size = new System.Drawing.Size(481, 150);
            this.dataGridProfesores.TabIndex = 0;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(544, 20);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(115, 47);
            this.button1.TabIndex = 1;
            this.button1.Text = "Ejecutar una consulta de UPDATE";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(42, 34);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(211, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Paso 1: Ejecutar una consulta con el boton";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(42, 63);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(258, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Paso 2: Cambiar la ciudad del Profesor en el dataGrid";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(531, 81);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(158, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Paso 3: Actualizar datos en Grid";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(42, 9);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(180, 20);
            this.label4.TabIndex = 5;
            this.label4.Text = "Prueba de Concurrencia";
            // 
            // btnActualizar
            // 
            this.btnActualizar.Location = new System.Drawing.Point(544, 99);
            this.btnActualizar.Name = "btnActualizar";
            this.btnActualizar.Size = new System.Drawing.Size(128, 31);
            this.btnActualizar.TabIndex = 6;
            this.btnActualizar.Text = "Actualizar Grid";
            this.btnActualizar.UseVisualStyleBackColor = true;
            this.btnActualizar.Click += new System.EventHandler(this.btnActualizar_Click);
            // 
            // txtProfesorID
            // 
            this.txtProfesorID.Location = new System.Drawing.Point(429, 20);
            this.txtProfesorID.Name = "txtProfesorID";
            this.txtProfesorID.Size = new System.Drawing.Size(100, 20);
            this.txtProfesorID.TabIndex = 7;
            // 
            // txtCiudad
            // 
            this.txtCiudad.Location = new System.Drawing.Point(429, 47);
            this.txtCiudad.Name = "txtCiudad";
            this.txtCiudad.Size = new System.Drawing.Size(100, 20);
            this.txtCiudad.TabIndex = 8;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(363, 23);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 13);
            this.label5.TabIndex = 9;
            this.label5.Text = "ID Profesor";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(381, 53);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(40, 13);
            this.label6.TabIndex = 10;
            this.label6.Text = "Cuidad";
            // 
            // btnActualizarconConcurrencia
            // 
            this.btnActualizarconConcurrencia.Location = new System.Drawing.Point(544, 159);
            this.btnActualizarconConcurrencia.Name = "btnActualizarconConcurrencia";
            this.btnActualizarconConcurrencia.Size = new System.Drawing.Size(128, 38);
            this.btnActualizarconConcurrencia.TabIndex = 11;
            this.btnActualizarconConcurrencia.Text = "Actualizar con Concurrencia";
            this.btnActualizarconConcurrencia.UseVisualStyleBackColor = true;
            this.btnActualizarconConcurrencia.Click += new System.EventHandler(this.btnActualizarconConcurrencia_Click);
            // 
            // btnTimeStamp
            // 
            this.btnTimeStamp.Location = new System.Drawing.Point(544, 204);
            this.btnTimeStamp.Name = "btnTimeStamp";
            this.btnTimeStamp.Size = new System.Drawing.Size(128, 45);
            this.btnTimeStamp.TabIndex = 12;
            this.btnTimeStamp.Text = "Actualizar con TimeStamp";
            this.btnTimeStamp.UseVisualStyleBackColor = true;
            this.btnTimeStamp.Click += new System.EventHandler(this.btnTimeStamp_Click);
            // 
            // frmConcurrencia
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(743, 261);
            this.Controls.Add(this.btnTimeStamp);
            this.Controls.Add(this.btnActualizarconConcurrencia);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtCiudad);
            this.Controls.Add(this.txtProfesorID);
            this.Controls.Add(this.btnActualizar);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.dataGridProfesores);
            this.Name = "frmConcurrencia";
            this.Text = "frmConcurrencia";
            this.Load += new System.EventHandler(this.frmConcurrencia_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridProfesores)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridProfesores;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnActualizar;
        private System.Windows.Forms.TextBox txtProfesorID;
        private System.Windows.Forms.TextBox txtCiudad;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnActualizarconConcurrencia;
        private System.Windows.Forms.Button btnTimeStamp;
    }
}