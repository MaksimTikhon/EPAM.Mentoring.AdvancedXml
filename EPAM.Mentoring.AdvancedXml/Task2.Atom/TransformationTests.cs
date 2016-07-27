using System;
using System.Xml.Xsl;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Task2.Atom
{
	[TestClass]
	public class TransformationTests
	{
		[TestMethod]
		public void TransformTest()
		{
			var xsl = new XslCompiledTransform();
			xsl.Load("transformation.xslt");

			xsl.Transform("books.xml", null, Console.Out);
			xsl.Transform("books.xml", "books-atom.xml");
		}
	}
}
