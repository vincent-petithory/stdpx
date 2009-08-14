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
	import flash.display.Shader;
	import flash.display.ShaderData;
	import flash.utils.ByteArray;

/**
 * A <code class="prettyprint">ShaderMetadata</code> holds metadata 
 * defined in the source code of shader byte code.
 */
public class ShaderMetadata 
{
	
	/**
	 * @private
	 */
	private var shaderData:ShaderData;
	
	/**
	 * Constructor.
	 * @param byteCode The byteCode of a shader, whose metadata will be stored.
	 */
	public function ShaderMetadata(byteCode:ByteArray) 
	{
		super();
		this.shaderData = new Shader(byteCode).data;
	}
	
	/**
	 * The description of the shader, as it is defined in the shader source.
	 */
	public function get description():String
	{
		return this.shaderData.description;
	}
	
	/**
	 * The version of the shader, as it is defined in the shader source.
	 */
	public function get version():String
	{
		return String(this.shaderData.version);
	}
	
	/**
	 * The name of the shader, as it is defined in the shader source.
	 */
	public function get name():String
	{
		return this.shaderData.name;
	}
	
	/**
	 * The namespace of the shader, as it is defined in the shader source.
	 */
	public function get namespace():String
	{
		return this.shaderData.namespace;
	}
	
	/**
	 * The vendor of the shader, as it is defined in the shader source.
	 */
	public function get vendor():String
	{
		return this.shaderData.vendor;
	}
	
	/**
	 * Returns a string representation of this 
	 * <code class="prettyprint">ShaderMetadata</code>.
	 * @return a string representation of this 
	 * <code class="prettyprint">ShaderMetadata</code>.
	 */
	public function toString():String
	{
		return name+" version "+version+" by "+vendor;
	}
	
}
	
}
