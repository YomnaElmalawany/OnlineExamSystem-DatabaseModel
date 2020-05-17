namespace crystalreport
{
    partial class Form1
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
            this.Report11 = new crystalreport.Report1();
            this.Report22 = new crystalreport.Report2();
            this.Report21 = new crystalreport.Report2();
            this.Report31 = new crystalreport.Report3();
            this.Report42 = new crystalreport.Report4();
            this.Report41 = new crystalreport.Report4();
            this.crystalReportViewer1 = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.Report51 = new crystalreport.Report5();
            this.Report61 = new crystalreport.Report6();
            this.SuspendLayout();
            // 
            // Report11
            // 
            this.Report11.InitReport += new System.EventHandler(this.Report11_InitReport);
            // 
            // crystalReportViewer1
            // 
            this.crystalReportViewer1.ActiveViewIndex = 0;
            this.crystalReportViewer1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.crystalReportViewer1.Cursor = System.Windows.Forms.Cursors.Default;
            this.crystalReportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.crystalReportViewer1.Location = new System.Drawing.Point(0, 0);
            this.crystalReportViewer1.Name = "crystalReportViewer1";
            this.crystalReportViewer1.ReportSource = this.Report51;
            this.crystalReportViewer1.Size = new System.Drawing.Size(824, 330);
            this.crystalReportViewer1.TabIndex = 0;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(824, 330);
            this.Controls.Add(this.crystalReportViewer1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer1;
        private Report1 Report11;
        private Report2 Report21;
        private Report2 Report22;
        private Report3 Report31;
        private Report4 Report41;
        private Report4 Report42;
        private Report6 Report61;
        private Report5 Report51;
    }
}

