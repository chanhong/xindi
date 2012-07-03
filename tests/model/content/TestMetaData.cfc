/*
	Xindi - http://www.getxindi.com/
	
	Copyright (c) 2012, Simon Bingham
	
	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
	files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, 
	modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software 
	is furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
	OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
	LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
	IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

component extends="mxunit.framework.TestCase"{
	
	// ------------------------ UNIT TESTS ------------------------ //
	
	function testGenerateMetaDescription()
	{
		var result = CUT.generateMetaDescription( description="Morbi at felis quis metus scelerisque venenatis. Curabitur ut tellus nec massa eleifend vestibulum! In non lectus sem; ut lacinia." );
		assertEquals( "Morbi at felis quis metus scelerisque venenatis. Curabitur ut tellus nec massa eleifend vestibulum! In non lectus sem; ut lacinia.", result );		
	}

	function testGenerateMetaKeywords()
	{
		var result = CUT.generateMetaKeywords( keywords="Morbi at felis quis metus scelerisque venenatis. Curabitur ut tellus nec massa eleifend vestibulum! In non lectus sem; ut lacinia." );
		assertEquals( "morbi,at,felis,quis,metus,scelerisque,venenatis,curabitur,ut,tellus,nec,massa,eleifend,vestibulum!,non,lectus,sem;,lacinia", result );		
	}

	function testGeneratePageTitle()
	{
		var result = CUT.generatePageTitle( websitetitle="foo", pagetitle="bar" );
		assertEquals( "bar | foo", result );		
	}
	
	function testListDeleteDuplicatesNoCase()
	{
		var result = CUT.listDeleteDuplicatesNoCase( thelist="Morbi,at,felis,quis,metus,scelerisque,venenatis,Morbi,at,felis,quis,metus,scelerisque,venenatis" );
		assertEquals( "Morbi,at,felis,quis,metus,scelerisque,venenatis", result );
	}	
	
	function testRemoveNonKeywords()
	{
		var result = CUT.removeNonKeywords( thestring="Morbi at felis quis metus scelerisque venenatis. Curabitur ut tellus nec massa eleifend vestibulum! In non lectus sem; ut lacinia." );
		assertEquals( "morbi at felis quis metus scelerisque venenatis curabitur ut tellus nec massa eleifend vestibulum! non lectus sem; ut lacinia", result  );
	}
	
	function testRemoveUnrequiredCharacters()
	{
		var result = CUT.removeUnrequiredCharacters( thestring="
		Morbi at felis quis 
		
		metus scelerisque venenatis. 
		
		Curabitur ut tellus nec massa eleifend 
		
		vestibulum! In non lectus sem; ut lacinia.	
		" );
		assertEquals( "morbi at felis quis       metus scelerisque venenatis.       curabitur ut tellus nec massa eleifend       vestibulum! in non lectus sem; ut lacinia.", result );		
	}	
	
	function testReplaceMultipleSpacesWithSingleSpace()
	{
		var result = CUT.replaceMultipleSpacesWithSingleSpace( thestring="Morbi at felis quis metus   scelerisque venenatis. Curabitur ut tellus nec massa eleifend   vestibulum! In non lectus sem; ut lacinia." );
		assertEquals( "Morbi at felis quis metus scelerisque venenatis. Curabitur ut tellus nec massa eleifend vestibulum! In non lectus sem; ut lacinia.", result );
	}

	function testStripHTML()
	{
		var result = CUT.stripHTML( thestring="<p>Morbi at felis quis metus scelerisque venenatis. Curabitur ut tellus nec massa eleifend vestibulum! In non lectus sem; ut lacinia.</p>" );
		assertEquals( "Morbi at felis quis metus scelerisque venenatis. Curabitur ut tellus nec massa eleifend vestibulum! In non lectus sem; ut lacinia.", result );
	}
	
	// ------------------------ IMPLICIT ------------------------ // 
	
	/**
	* this will run before every single test in this test case
	*/
	function setUp(){
		// initialise component under test
		CUT = new model.content.MetaData(); 
	}
	
	/**
	* this will run after every single test in this test case
	*/
	function tearDown(){}
	
	/**
	* this will run once after initialization and before setUp()
	*/
	function beforeTests(){}
	
	/**
	* this will run once after all tests have been run
	*/
	function afterTests(){}
	
}