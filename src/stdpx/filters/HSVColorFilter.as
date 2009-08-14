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
	import flash.display.ShaderParameter;
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;

public class HSVColorFilter extends ShaderFilter 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="HSVColorFilter.pbj", 
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
	
	public static function get minHue():int
	{
		return shaderData.hue.minValue[0];
	}
	
	public static function get maxHue():int
	{
		return shaderData.hue.maxValue[0];
	}
	
	public static function get defaultHue():int
	{
		return shaderData.hue.defaultValue[0];
	}
	
	public static function get minSaturation():int
	{
		return shaderData.saturation.minValue[0];
	}
	
	public static function get maxSaturation():int
	{
		return shaderData.saturation.maxValue[0];
	}
	
	public static function get defaultSaturation():int
	{
		return shaderData.saturation.defaultValue[0];
	}
	
	public static function get minValue():int
	{
		return shaderData.value.minValue[0];
	}
	
	public static function get maxValue():int
	{
		return shaderData.value.maxValue[0];
	}
	
	public static function get defaultValue():int
	{
		return shaderData.value.defaultValue[0];
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
	
	public function HSVColorFilter(hue:int = 0, saturation:int = 0, value:int = 0) 
	{
		super();
		_shader = new Shader(new ShaderByteCode());
		this.hue = hue;
		this.saturation = saturation;
		this.value = value;
		this.shader = _shader;
	}
	
	public function get hue():int
	{
		return this.shader.data.hue.value[0];
	}
	
	/**
	 * @private
	 */
	public function set hue(value:int):void
	{
		_shader.data.hue.value[0] = Math.max(minHue, Math.min(maxHue, value));
		this.shader = _shader;
	}
	
	public function get saturation():int
	{
		return this.shader.data.saturation.value[0];
	}
	
	/**
	 * @private
	 */
	public function set saturation(value:int):void
	{
		_shader.data.saturation.value[0] = Math.max(minSaturation, Math.min(maxSaturation, value));
		this.shader = _shader;
	}
	
	public function get value():int
	{
		return this.shader.data.value.value[0];
	}
	
	/**
	 * @private
	 */
	public function set value(value:int):void
	{
		_shader.data.value.value[0] = Math.max(minValue, Math.min(maxValue, value));
		this.shader = _shader;
	}
	
	override public function clone():BitmapFilter
	{
		return new HSVColorFilter(hue,saturation,value);
	}
	
}
	
}
