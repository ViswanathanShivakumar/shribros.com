namespace Shribros.Website
{
    /// <summary>
    /// Summary description for StringExtension
    /// </summary>
    public static class StringExtension
    {
        public static string RemoveExtension(this string filename)
        {
            int index = filename.IndexOf('.');
            return filename.Substring(0, index);
        }
    }
}