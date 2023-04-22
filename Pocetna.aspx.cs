using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B12
{
    public partial class Pocetna : System.Web.UI.Page
    {
        /*Ako negde pri pravljenju con stringa dobijete gresku tipa:
         * keyword not supported, trust server certificate, mozda nije dobar konekcioni string,
         * treba da izgleda kao ovaj ovde. Problem se resava tako sto poslednju deo treba da izgleda ovako:
         * TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False
         * tj sve mora biti spojeno, a NE odvojeno.
         
         */

        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=B12;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        SqlCommand cmd;
        SqlDataReader dr;

        protected void obojiSedista()
        {
            try
            {
                con.Open();
                string upit = "SELECT BrojSedista,Rezervacija FROM Sedista";
                cmd = new SqlCommand(upit, con);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    int brSedista = int.Parse(dr["BrojSedista"].ToString());
                    Button sediste = (Button)Panel1.FindControl("Button" + brSedista);

                    //bit--> nije rezervisano: 0 - false,
                    //     rezervisano: 1 - true 

                    if ((bool)(dr["Rezervacija"]) == true)
                        sediste.BackColor = Color.Red;
                    else
                        sediste.BackColor = Color.Green;
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                Label5.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
        }





        protected void Page_Load(object sender, EventArgs e)
        {

            

            int br = 2;
            for (int i = 1; i < 53; i++)
            {
                Button b = new Button();
                b.Text = br.ToString();
                b.ID = "Button" + br;
                b.Width = 40;
                b.Height = 40;
                b.ForeColor = Color.White;
                b.BorderColor = Color.White;
                b.Click += new EventHandler(sediste_klik);
                Panel1.Controls.Add(b);
                br++;
                if (i % 4 == 0)
                {
                    Literal lit = new Literal();
                    lit.Text = "<br>";
                    Panel1.Controls.Add(lit);
                }
            }
            obojiSedista();
        }

        private void sediste_klik(object sender, EventArgs e)
        {
            Label5.Text = "";
            Button btnKlik = sender as Button;
            if (btnKlik.BackColor == Color.Red)
            {
                Label5.Text = "Sediste je vec rezervisano!";
                return;
            }
            TextBox1.Text = btnKlik.Text;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "")
            {
                int brSedista = int.Parse(TextBox1.Text);
                Button sedisteZaRezervaciju = (Button)form1.FindControl("Button" + brSedista);
                sedisteZaRezervaciju.BackColor = Color.Red;

                try
                {
                    con.Open();
                    string upit = "UPDATE Sedista SET Rezervacija=1 WHERE BrojSedista=" + brSedista;
                    cmd = new SqlCommand(upit, con);
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Label5.Text = ex.Message;
                }
                finally
                {
                    con.Close();
                }
                TextBox1.Text = TextBox2.Text = TextBox3.Text = "";
                Label5.Text = "";
            }
            else
            {
                Label5.Text = "Niste izabrali sediste i popunili podatke!";
            }
        }
    }
}