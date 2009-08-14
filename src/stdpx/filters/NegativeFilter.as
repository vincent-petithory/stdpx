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

public class NegativeFilter extends ShaderFilter 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="NegativeFilter.pbj", 
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
	
	public static function get minIntensity():Number
	{
		return shaderData.intensity.minValue[0];
	}
	
	public static function get maxIntensity():Number
	{
		return shaderData.intensity.maxValue[0];
	}
	
	public static function get defaultIntensity():Number
	{
		return shaderData.intensity.defaultValue[0];
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
	
	/**
	 * Constructor.
	 */
	public function NegativeFilter(intensity:Number = 1) 
	{
		super();
		_shader = new Shader(new ShaderByteCode());
		this.intensity = intensity;
		this.shader = _shader;
	}
	
	/**
	 * Increases or decreases the filtered image lightness. 
	 * <p>Valid values ar between <code class="prettyprint">-100</code> 
	 * and <code class="prettyprint">100</code>.</p>
	 */
	public function get intensity():Number
	{
		return this.shader.data.intensity.value[0];
	}
	
	/**
	 * @private
	 */
	public function set intensity(value:Number):void
	{
		_shader.data.intensity.value[0] = Math.max(minIntensity,Math.min(value,maxIntensity));
		this.shader = _shader;
	}
	
	override public function clone():BitmapFilter
	{
		return new NegativeFilter(intensity);
	}
	
}
	
}
