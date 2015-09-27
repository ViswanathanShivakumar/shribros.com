using System;
using System.Collections.Generic;
using Enum;

/// <summary>
/// Summary description for ReviewInfo
/// </summary>
public class ReviewInfo
{
    public ReviewType ReviewType { get; set; }
    public string Name { get; set; }
    public string LinkName { get; set; }
    public DateTime DateModified { get; set; }
}
public class ReviewInfoDateComparer : IComparer<ReviewInfo>
{
    public int Compare(ReviewInfo x, ReviewInfo y)
    {
        if (y.DateModified > x.DateModified)
            return 1;

        if (x.DateModified > y.DateModified)
            return -1;

        return 0;
    }
}
public class ReviewInfoNameComparer : IComparer<ReviewInfo>
{
    public int Compare(ReviewInfo x, ReviewInfo y)
    {
        return x.Name.CompareTo(y.Name);
    }
}