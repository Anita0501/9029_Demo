using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MainMenu
/// </summary>
public class MainMenu
{
    public int MainId { get; set; }
    public string MainName { get; set; }
    public MainMenu(int id, string name)
    {
        MainId = id;
        MainName = name;
    }
}