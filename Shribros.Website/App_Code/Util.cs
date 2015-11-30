using System;

namespace Shribros.Website
{
    public class Util
    {
        public string Date
        {
            get
            { return DateTime.Now.Month + "/" + DateTime.Now.Day + "/" + DateTime.Now.Year; }
        }
    }
}
