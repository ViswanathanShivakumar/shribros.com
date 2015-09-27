using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Xml;
using System.Xml.Linq;

namespace Shribros.Photography.XMLGenerator
{
    /// <summary>
    /// Part of Automation for Shribros website
    /// Helps to create xml data from list of folder and files for Photography page
    /// </summary>
    internal class Program
    {
        static void Main(string[] args)
        {
            var xmlDocumentBuilder = new StringBuilder();
            xmlDocumentBuilder.Append(@"<Shribros.Photography.Data>");
            //Loop through subdirectories
            List<string> directories = Directory.GetDirectories(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)).ToList();

            string digitalDesign = directories.First(x => x.Contains("Digital"));
            directories.Remove(digitalDesign);
            directories.Insert(0, digitalDesign);

            string panaroma = directories.First(x => x.Contains("Panaroma"));
            directories.Remove(panaroma);
            directories.Insert(11, panaroma);

            foreach (string category in directories)
            {
                var directoryInfo = new DirectoryInfo(category);
                xmlDocumentBuilder.Append(string.Format(@"<Category Name=""{0}"">", directoryInfo.Name));
                //Loop through files in the directory
                foreach (string file in Directory.GetFiles(category))
                {
                    try
                    {
                        var fileInfo = new FileInfo(file);
                        using (var sourceImage = System.Drawing.Image.FromFile(file))
                        {
                            string caption = string.Empty, iso = string.Empty, exposure = string.Empty, fstop = string.Empty, focalLength = string.Empty, camera = string.Empty;
                            //Read properties
                            foreach (System.Drawing.Imaging.PropertyItem prop in sourceImage.PropertyItems)
                            {
                                if (prop.Id == 0x8827) //ISO - Type 3
                                {
                                    iso = BitConverter.ToInt16(prop.Value, 0).ToString(CultureInfo.InvariantCulture);
                                }
                                if (prop.Id == 0x829A) //Exposure - Type 5
                                {
                                    if (BitConverter.ToUInt32(prop.Value, 0) == 1)
                                    {
                                        exposure = string.Format("{0}/{1}", BitConverter.ToUInt32(prop.Value, 0),
                                            BitConverter.ToUInt32(prop.Value, 4));
                                    }
                                    else
                                    {
                                        exposure = string.Format("{0} Second(s)", BitConverter.ToUInt32(prop.Value, 0));
                                    }
                                }
                                if (prop.Id == 0x829D) //F-Stop - Type 5
                                {
                                    string fstopValue = Math.Round(BitConverter.ToUInt32(prop.Value, 0) / (decimal)BitConverter.ToUInt32(prop.Value, 4), 1).ToString(CultureInfo.InvariantCulture);
                                    fstop = string.Format("F{0}", fstopValue);
                                }
                                if (prop.Id == 0x920A) //Focal Length - Type 5
                                {
                                    //focalLength = string.Format("{0}mm", BitConverter.ToInt16(prop.Value, 0).ToString(CultureInfo.InvariantCulture));

                                    var propValue = new int[prop.Len / 4];
                                    var value = prop.Value;
                                    for (int i = 0; i < prop.Len; i += 4)
                                    {
                                        propValue[i / 4] = value[i + 3] << 24 | value[i + 2] << 16 | value[i + 1] << 8 | value[i];
                                    }
                                    focalLength = string.Format("{0} mm",
                                        (propValue[0] / propValue[1]).ToString(CultureInfo.InvariantCulture));
                                }
                                if (prop.Id == 0x0110) //Camera - Type 2
                                {
                                    camera = Encoding.ASCII.GetString(prop.Value.Take(prop.Len - 1).ToArray());
                                }
                                if (prop.Id == 0x9C9C) //Comment - Type 2
                                {
                                    caption = Encoding.Unicode.GetString(prop.Value.Take(prop.Len - 2).ToArray());
                                }
                            }
                            xmlDocumentBuilder.Append(
                                string.Format(
                                    @"<File Caption=""{0}"" Iso=""{1}"" Exposure=""{2}"" Fstop=""{3}"" FocalLength=""{4}"" Camera=""{5}"" FileName=""{6}""/>",
                                    caption,
                                    iso, exposure, fstop, focalLength, camera, fileInfo.Name));
                        }
                        Console.WriteLine("Added image {0}", file);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Failed to process image {0} due to error {1}", file, ex.Message);
                    }
                }
                xmlDocumentBuilder.Append(@"</Category>");
            }
            xmlDocumentBuilder.Append(@"</Shribros.Photography.Data>");

            //Write to file
            string formattedXml = XElement.Parse(xmlDocumentBuilder.ToString()).ToString();
            File.WriteAllText("Shribros.Photography.Data.xml", formattedXml);
            Console.WriteLine("Processing Complete");
            Console.ReadLine();
        }

        private static string ToCommaSeparatedString<T>(ICollection<T> collection)
        {
            return collection != null ? string.Join(",", collection.ToArray()) : null;
        }
    }
}
