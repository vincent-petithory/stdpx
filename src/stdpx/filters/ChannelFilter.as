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

package stdpx.filters 
{
	import stdpx.types.ShaderMetadata;
	import flash.display.Shader;
	import flash.display.ShaderData;
	
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;

public class ChannelFilter extends ShaderFilter 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="ChannelFilter.pbj", 
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
	
	/**
	 * @private
	 */
	private static var _shaderData:ShaderData;
	
	/**
	 * @private
	 */
	private static function get shaderData():ShaderData
	{
		if (!_shaderData)
		{
			_shaderData = new Shader(new ShaderByteCode()).data;
		}
		return _shaderData;
	}
	
	/**
	 * @private
	 * A reference to the internal shader.
	 */
	private var _shader:Shader;
	
	public function ChannelFilter(
								keepRed:Boolean = true, 
								keepGreen:Boolean = true, 
								keepBlue:Boolean = true, 
								keepAlpha:Boolean = true
							) 
	{
		super();
		_shader = new Shader(new ShaderByteCode());
		this.keepRed = keepRed;
		this.keepGreen = keepGreen;
		this.keepBlue = keepBlue;
		this.keepAlpha = keepAlpha;
		this.shader = _shader;
	}
	
	public function get keepRed():Boolean
	{
		return this._shader.data.channels.value[0] == 1;
	}
	
	public function set keepRed(value:Boolean):void
	{
		this._shader.data.channels.value[0] = value ? 1 : 0;
	}
	
	public function get keepGreen():Boolean
	{
		return this._shader.data.channels.value[1] == 1;
	}
	
	public function set keepGreen(value:Boolean):void
	{
		this._shader.data.channels.value[1] = value ? 1 : 0;
	}
	
	public function get keepBlue():Boolean
	{
		return this._shader.data.channels.value[2] == 1;
	}
	
	public function set keepBlue(value:Boolean):void
	{
		this._shader.data.channels.value[2] = value ? 1 : 0;
	}
	
	public function get keepAlpha():Boolean
	{
		return this._shader.data.channels.value[3] == 1;
	}
	
	public function set keepAlpha(value:Boolean):void
	{
		this._shader.data.channels.value[3] = value ? 1 : 0;
	}
	
	override public function clone():BitmapFilter
	{
		return new ChannelFilter(keepRed,keepGreen,keepBlue,keepAlpha);
	}
	
}
	
}
