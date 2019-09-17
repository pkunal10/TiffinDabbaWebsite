using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AppHomeViewModal
/// </summary>
public class AppHomeViewModal
{
    public AppHomeViewModal()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<SimpleTiffins> SimpleTiffinList { get; set; }
    public List<TiffinWithSweets> TiffinWithSweetsList { get; set; }
    public List<SpecialTiffins> SpecialTiffinList { get; set; }
    public List<FastFoodProduct> FastFoodList { get; set; }
    public List<string> Images { get; set; }
    public List<string> OrderTimmings { get; set; }
}