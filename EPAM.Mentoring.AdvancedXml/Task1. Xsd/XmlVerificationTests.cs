using System;
using System.Xml;
using System.Xml.Schema;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Task1.Xsd
{
	[TestClass]
	public class XmlVerificationTests
	{
		XmlReaderSettings _settings;
		private int _errorCount;

		[TestInitialize]
		public void Init()
		{
			_settings = new XmlReaderSettings();

			_settings.Schemas.Add("http://library.by/catalog", "books.xsd");
			_settings.ValidationEventHandler +=
				delegate (object sender, ValidationEventArgs e)
				{
					_errorCount++;
					Console.WriteLine("[{0}:{1}] {2}", e.Exception.LineNumber, e.Exception.LinePosition, e.Message);
				};

			_settings.ValidationFlags = _settings.ValidationFlags | XmlSchemaValidationFlags.ReportValidationWarnings;
			_settings.ValidationType = ValidationType.Schema;
		}

		[TestMethod]
		public void CheckValidXml()
		{
			_errorCount = 0;
			XmlReader reader = XmlReader.Create("books.xml", _settings);

			while (reader.Read()) { }

			Assert.AreEqual(_errorCount, 0);
		}

		[TestMethod]
		public void CheckInvalidXml()
		{
			_errorCount = 0;
			XmlReader reader = XmlReader.Create("booksInvalid.xml", _settings);

			while (reader.Read()) { }

			Assert.AreNotEqual(_errorCount, 0);
		}
	}
}
