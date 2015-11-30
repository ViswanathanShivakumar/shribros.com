using System;
using System.Text;

public class Crypt
{
    public static string Encode(string text)
    {
        return Convert.ToBase64String(Encoding.ASCII.GetBytes(text));
    }
    public static string Dencode(string text)
    {
        return Encoding.ASCII.GetString(Convert.FromBase64String(text));
    }
}
