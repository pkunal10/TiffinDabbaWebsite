using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cart
/// </summary>
public class Cart
{
	public Cart()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string provider_id { get; set; }

    public string Qty { get; set; }
    public string product_name { get; set; }
    public string price { get; set; }
    public string DiscountedPrice { get; set; }
    public string image { get; set; }
    public string product_id { get; set; }
}