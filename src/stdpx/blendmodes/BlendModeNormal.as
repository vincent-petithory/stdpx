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

package stdpx.blendmodes 
{
	import stdpx.types.ShaderMetadata;
	import flash.display.Shader;

public class BlendModeNormal extends Shader 
{
	
	[Embed(source="BlendModeNormal.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	/**
	 * @private
	 */
	private static var _shaderMetadata:ShaderMetadata;
	
	/**
	 * The metadata of the shader
	 */
	public function get metadata():ShaderMetadata
	{
		if (!_shaderMetadata)
		{
			_shaderMetadata = new ShaderMetadata(new ShaderByteCode());
		}
		return _shaderMetadata;
	}
	
	public function BlendModeNormal() 
	{
		super();
		this.byteCode = new ShaderByteCode();
	}
	
	public function clone():Shader
	{
		return new BlendModeNormal();
	}
	
	
}
	
}
