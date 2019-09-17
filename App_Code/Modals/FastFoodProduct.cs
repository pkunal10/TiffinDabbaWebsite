using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FastFoodProduct
/// </summary>
public class FastFoodProduct
{
    public FastFoodProduct()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string ProductId { get; set; }
    public string CategoryId { get; set; }
    public string ProviderCity { get; set; }
    public string ProviderId { get; set; }
    public string ProductName { get; set; }
    public string Description { get; set; }
    public string Price { get; set; }
    public string StartTime { get; set; }
    public string EndTime { get; set; }
    public string Image { get; set; }
    public string Status { get; set; }
    public string CanBook { get; set; }
    public string DiscountedPrice { get; set; }

    //For Order History Start

    public string BookDate { get; set; }
    public string Quntity { get; set; }
    public string TotalPrice { get; set; }
    public string OrderStatus { get; set; }

    //For Order History End



}