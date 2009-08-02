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
	import flash.display.ShaderParameter;
	import flash.utils.ByteArray;

/**
 * A <code class="prettyprint">ShaderMetadata</code> holds metadata 
 * defined in the source code of a shader.
 */
public class ShaderMetadata 
{
	
	/**
	 * @private
	 */
	private var shaderData:ShaderData;
	
	/**
	 * @private
	 */
	private var projectMetadata:BasicProjectMetadata;
	
	
	/**
	 * Constructor.
	 * @param byteCode The byteCode of the shader whose metadata will be stored.
	 */
	public function ShaderMetadata(byteCode:ByteArray) 
	{
		super();
		this.shaderData = new Shader(byteCode).data;
		this.projectMetadata = new BasicProjectMetadata();
		this.projectMetadata.description = this.shaderData.description;
		this.projectMetadata.version = this.shaderData.version;
		this.projectMetadata.name = this.shaderData.name;
		this.projectMetadata.ns = this.shaderData.namespace;
		this.projectMetadata.vendor = this.shaderData.vendor;
	}
	
	public function get general():BasicProjectMetadata
	{
		return this.projectMetadata;
	}
	
	/**
	* @private
	*/
	private var _parameters:Vector.<ShaderParameter>;
	
	/**
	 * The list of parameters of the shader, as they are defined in the shader source.
	 */
	public function get parameters():Vector.<ShaderParameter>
	{
		if (!_parameters)
		{
			_parameters = new Vector.<ShaderParameter>();
			for (var name:String in shaderData)
			{
				if (shaderData[name] is ShaderParameter)
				{
					_parameters.push(shaderData[name]);
				}
			}
			
		}
		return _parameters;
	}
	
	/**
	 * Returns a string representation of this 
	 * <code class="prettyprint">ShaderMetadata</code>.
	 * @return a string representation of this 
	 * <code class="prettyprint">ShaderMetadata</code>.
	 */
	public function toString():String
	{
		return general.name+" version "+general.version+" by "+general.vendor;
	}
	
	/**
	* Returns the shader data of the described shader.
	* @return the shader data of the described shader.
	*/
	public function valueOf():ShaderData
	{
		return this.shaderData;
	}
	
}
	
}
