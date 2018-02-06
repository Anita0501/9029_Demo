using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Sub
/// </summary>
public class Sub
{
    public int SiteId { get; set; }
    public int MainId { get; set; }
    public string SiteName { get; set; }
    public string Url { get; set; }
    public Sub(int site, int main, string name, string url)
    {
        SiteId = site;
        MainId = main;
        SiteName = name;
        Url = url;
    }
}