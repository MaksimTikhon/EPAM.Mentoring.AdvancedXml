using System;
using System.IO;
using System.Xml.Xsl;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Task3.Report
{
	[TestClass]
	public class TransformationTests
	{
		[TestMethod]
		public void ReportTransormTest()
		{
			var xsl = new XslCompiledTransform();
			xsl.Load("reportTransformation.xslt");
			var xslParams = new XsltArgumentList();
			xslParams.AddParam("Date", "", DateTime.Now.Date.ToString("dd-MM-yyyy"));
			xsl.Transform("books.xml", xslParams, Console.Out);

			using (Stream stream = File.Create("report.html"))
			{
				using (TextWriter writer = new StreamWriter(stream))
				{
					xsl.Transform("books.xml", xslParams, writer);
				}
			}
		}
	}
}
