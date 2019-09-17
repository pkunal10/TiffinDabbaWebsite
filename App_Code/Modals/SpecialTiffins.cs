using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SpecialTiffins
/// </summary>
public class SpecialTiffins
{
	public SpecialTiffins()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string TiffinId { get; set; }
    public string ProviderId { get; set; }
    public string ProviderCity { get; set; }
    public string TiffinName { get; set; }
    public string Description { get; set; }
    public string Price { get; set; }
    public string StartTime { get; set; }
    public string EndTime { get; set; }
    public string Image { get; set; }
    public string Status { get; set; }
    public string CanBook { get; set; }
    public string OrderStatus { get; set; }
    public string BookDate { get; set; }
    public string BookTime { get; set; }
    public string IsVacation { get; set; }
    public string BtnTxt { get; set; }
}