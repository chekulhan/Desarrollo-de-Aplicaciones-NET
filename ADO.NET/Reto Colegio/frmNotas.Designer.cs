namespace WindowsFormsERPVuelos
{
    partial class frmNotas
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
            this.dgridNotas = new System.Windows.Forms.DataGridView();
            this.btnActualizar = new System.Windows.Forms.Button();
            this.btnActualizarconTransaccion = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgridNotas)).BeginInit();
            this.SuspendLayout();
            // 
            // dgridNotas
            // 
            this.dgridNotas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgridNotas.Location = new System.Drawing.Point(33, 69);
            this.dgridNotas.Name = "dgridNotas";
            this.dgridNotas.Size = new System.Drawing.Size(349, 177);
            this.dgridNotas.TabIndex = 0;
            // 
            // btnActualizar
            // 
            this.btnActualizar.Location = new System.Drawing.Point(388, 208);
            this.btnActualizar.Name = "btnActualizar";
            this.btnActualizar.Size = new System.Drawing.Size(86, 38);
            this.btnActualizar.TabIndex = 1;
            this.btnActualizar.Text = "Actualizar";
            this.btnActualizar.UseVisualStyleBackColor = true;
            this.btnActualizar.Click += new System.EventHandler(this.btnActualizar_Click);
            // 
            // btnActualizarconTransaccion
            // 
            this.btnActualizarconTransaccion.Location = new System.Drawing.Point(494, 208);
            this.btnActualizarconTransaccion.Name = "btnActualizarconTransaccion";
            this.btnActualizarconTransaccion.Size = new System.Drawing.Size(104, 38);
            this.btnActualizarconTransaccion.TabIndex = 2;
            this.btnActualizarconTransaccion.Text = "Actualizar con Transacciones";
            this.btnActualizarconTransaccion.UseVisualStyleBackColor = true;
            this.btnActualizarconTransaccion.Click += new System.EventHandler(this.btnActualizarconTransaccion_Click);
            // 
            // frmNotas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(623, 345);
            this.Controls.Add(this.btnActualizarconTransaccion);
            this.Controls.Add(this.btnActualizar);
            this.Controls.Add(this.dgridNotas);
            this.Name = "frmNotas";
            this.Text = "frmNotas";
            this.Load += new System.EventHandler(this.frmNotas_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgridNotas)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgridNotas;
        private System.Windows.Forms.Button btnActualizar;
        private System.Windows.Forms.Button btnActualizarconTransaccion;
    }
}