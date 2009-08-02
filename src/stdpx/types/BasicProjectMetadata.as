///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2008-2009 Vincent Petithory - http://blog.lunar-dev.net/
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE. 
///////////////////////////////////////////////////////////////////////////////

package stdpx.types 
{


/**
 * A <code class="prettyprint">BasicProjectMetadata</code> holds metadata 
 * about a project entity.
 */
public class BasicProjectMetadata 
{
	
	/**
	 * The description of the project.
	 */
	public var description:String;
	
	/**
	 * The version of the project.
	 */
	public var version:String;
	
	/**
	 * The name of the project.
	 */
	public var name:String;
	
	/**
	 * The namespace of the project.
	 */
	public var ns:String;
	
	/**
	 * The vendor of the project.
	 */
	public var vendor:String;
	
	/**
	 * Returns a string representation of this 
	 * <code class="prettyprint">BasicProjectMetadata</code>.
	 * @return a string representation of this 
	 * <code class="prettyprint">BasicProjectMetadata</code>.
	 */
	public function toString():String
	{
		return name+" version "+version+" by "+vendor;
	}
	
	/**
	* Returns the name of the described project.
	* @return the name of the described project.
	*/
	public function valueOf():String
	{
		return this.name;
	}
	
}
	
}
