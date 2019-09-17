using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for DataCon
/// </summary>
public class DataCon
{
    MySqlCommand cmd;
    MySqlConnection con; 
    MySqlDataAdapter da;

    //public DataCon()
    //{
    //    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    //    con = new MySqlConnection(constr);
    //    con.Open();
    //}
    public void setdata(string s)
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        con = new MySqlConnection(constr);
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }
        //try
        // {
        cmd = new MySqlCommand(s, con);
        cmd.ExecuteNonQuery();
        con.Close();
        //}
        //catch (Exception ex)
        //{
        //    throw ex;
        //}
    }
    public DataSet getdata(string s)
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        con = new MySqlConnection(constr);
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }
        da = new MySqlDataAdapter(s, con);
        DataSet ds = new DataSet();
        da.Fill(ds);        
        con.Close();
        return ds;
    }
    public string GenerateRandomNo()
    {
        string number = String.Format("{0:d9}", (DateTime.Now.Ticks / 10) % 1000000000);
        return number;
    }
}