<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DefaultHeadContentPlaceHolder" runat="Server">
    <title>Shribros - Photography</title>
    <script src="<%=Page.ResolveUrl("../../JS/jquery.elevatezoom.js") %>" type="text/javascript"></script>
    <script src="<%=Page.ResolveUrl("../../JS/Lightbox/lightbox.js") %>" type="text/javascript"></script>
    <link href="<%=Page.ResolveUrl("../../CSS/Lightbox/lightbox.css") %>" rel="stylesheet" type="text/css" media="screen" />
    <link href="<%=Page.ResolveUrl("../../CSS/Photography.css") %>" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("html").scalableBackground("<%=Page.ResolveUrl("bg.jpg") %>", 2500, 1267);
        });

        function ActivateLightbox(category) {
            $("a[data-lightbox='" + category + "']").first().trigger('click', []);
            $("#zoom_01").elevateZoom();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="DefaultBodyContentPlaceHolder" runat="Server">
    <br />
    <br />
    <div class="photography">
        <ul>
            <%
                const string photographyDataXml = "Shribros.Photography.Data.xml";
                const string thumbNailFile = "Thumb.jpg";

                const string tagNameCategory = "Category";

                const string attributeName = "Name";
                const string attributeFileName = "FileName";
                const string attributeCaption = "Caption";
                const string attributeCamera = "Camera";
                const string attributeExposure = "Exposure";
                const string attributeFstop = "Fstop";
                const string attributeFocalLength = "FocalLength";
                const string attributeIso = "Iso";

                var photographyData = new XmlDocument();
                photographyData.Load(Server.MapPath(photographyDataXml));

                foreach (XmlNode category in photographyData.GetElementsByTagName(tagNameCategory))
                {
                    if (category.Attributes == null)
                        continue;
                    string categoryname = category.Attributes[attributeName].Value;
                    foreach (XmlNode file in category.ChildNodes)
                    {
                        if (file.Attributes == null)
                            continue;
                        string fileName = file.Attributes[attributeFileName].Value;
                        if (fileName == thumbNailFile)
                        {
            %>
            <li>
                <a href="javascript:ActivateLightbox('<%=categoryname %>')">
                    <img src="<%=categoryname %>/<%=fileName %>" alt="Thumbnail Image" title="CategoryLinks" />
                    <div class="caption"><%=categoryname %></div>
                </a>
            </li>
            <%  
                        }
                        else
                        {
                            var imageProperty = new StringBuilder();
                            if (file.Attributes[attributeCaption].Value != string.Empty) imageProperty.AppendLine(string.Format("{0} <br /> <br />", file.Attributes[attributeCaption].Value));
                            if (file.Attributes[attributeCamera].Value != string.Empty) imageProperty.AppendLine(string.Format(@"Camera: {0} <br />", file.Attributes[attributeCamera].Value));
                            if (file.Attributes[attributeExposure].Value != string.Empty) imageProperty.AppendLine(string.Format(@"Exposure: {0} <br />", file.Attributes[attributeExposure].Value));
                            if (file.Attributes[attributeFstop].Value != string.Empty) imageProperty.AppendLine(string.Format(@"F-Stop: {0} <br />", file.Attributes[attributeFstop].Value));
                            if (file.Attributes[attributeFocalLength].Value != string.Empty) imageProperty.AppendLine(string.Format(@"Focal Length: {0} <br />", file.Attributes[attributeFocalLength].Value));
                            if (file.Attributes[attributeIso].Value != string.Empty) imageProperty.AppendLine(string.Format(@"ISO: {0} <br /> <br />", file.Attributes[attributeIso].Value));
            %>
            <a href="<%=categoryname %>/<%=fileName %>" data-lightbox="<%=categoryname%>" data-title="<%=imageProperty.ToString() %>"></a>
            <%
                        }
                    }
                }
            %>
        </ul>
    </div>

    <p>
        View/Purchase photographs and designs at <a href="http://www.fotolia.com/p/200663510"
            target="_blank">Fotolia</a> | <a href="http://www.dreamstime.com/shribros_info" target="_blank">Dreamstime</a>
    </p>
    <p>"Take lot of pictures, you cannot remember everything!"</p>

    <p>The sound of the lens adjusting itself to focus on the SLR, is a fascinating one and so is the output that we might get out of a click. Our natural attraction towards hues and saturations pulled us towards photography.</p>
    <p>It was right from when we started with age old rolling film cameras which we borrowed every now and then, from our neighbors and friends. As we tried more of it and imitated classic photographs, we acquired familiarity of the subject and learned that a say single click could say a thousand stories.</p>
    <p>We own a couple of Canon SLRs, with which we continue our trial and error and trying to making sure that the error count decreases.</p>

    <form id="form1" runat="server">
        <ShribrosControl:PostComment ID="PostComment1" runat="server" />
    </form>
</asp:Content>
