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

/**
 * The <code class="prettyprint">ContrastLightnessFilter</code> class allows 
 * filtering display objects by adjusting their lightness and contrast. 
 * It behaves like Photoshop's Lightness/Contrast adjustement.
 * 
 * <p>You may use this class as an usual filter class : </p>
 * <pre class="prettyprint">
 * var filter:ContrastLightnessFilter = new ContrastLightnessFilter(-20, 10);
 * 
 * // with a DisplayObject or a subclass
 * myDisplayObject.filters = [filter];
 * 
 * // or with a BitmapData object
 * myBitmapData.applyFilter(myBitmapData, myBitmapData.rect, 
 * 							new Point(), filter);
 * </pre>
 * 
 */
public class ContrastLightnessFilter extends ShaderFilter
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="ContrastLightnessFilter.pbj", 
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
	 * The minimum lightness defined in the shader source.
	 * 
	 * <p>You may change it to allow lesser values to all 
	 * <code class="prettyprint">ContrastLightnessFilter</code> objects</p>
	 */
	public static function get minLightness():int
	{
		return shaderData.lightness.minValue[0];
	}
	
	/**
	 * The maximum lightness defined in the shader source.
	 * 
	 * <p>You may change it to allow higher values to all 
	 * <code class="prettyprint">ContrastLightnessFilter</code> objects</p>
	 */
	public static function get maxLightness():int
	{
		return shaderData.lightness.maxValue[0];
	}
	
	/**
	 * The default lightness defined in the shader source.
	 * 
	 * <p>It is not automatically applied as default values of this 
	 * <code class="prettyprint">ContrastLightnessFilter</code> filter. 
	 * If this value is passed, it will remain the input image unchanged.</p>
	 */
	public static function get defaultLightness():int
	{
		return shaderData.lightness.defaultValue[0];
	}
	
	/**
	 * The minimum contast defined in the shader source.
	 * 
	 * <p>You may change it to allow lesser values to all 
	 * <code class="prettyprint">ContrastLightnessFilter</code> objects</p>
	 */
	public static function get minContrast():int
	{
		return shaderData.contrast.minValue[0];
	}
	
	/**
	 * The maximum contrast defined in the shader source.
	 * 
	 * <p>You may change it to allow higher values to all 
	 * <code class="prettyprint">ContrastLightnessFilter</code> objects</p>
	 */
	public static function get maxContrast():int
	{
		return shaderData.contrast.maxValue[0];
	}
	
	/**
	 * The default contrast defined in the shader source.
	 * 
	 * <p>It is not automatically applied as default values of this 
	 * <code class="prettyprint">ContrastLightnessFilter</code> filter. 
	 * If this value is passed, it will remain the input image unchanged.</p>
	 */
	public static function get defaultContrast():int
	{
		return shaderData.contrast.defaultValue[0];
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
	 * 
	 * @param lightness increases or decreases the filtered image lightness. 
	 * Between <code class="prettyprint">-100</code> and 
	 * <code class="prettyprint">100</code>.
	 * @param contrast increases or decreases the filtered image contrast. 
	 * Between <code class="prettyprint">-100</code> and 
	 * <code class="prettyprint">100</code>
	 */
	public function ContrastLightnessFilter(
											contrast:int = 0, 
											lightness:int = 0
											) 
	{
		super();
		_shader = new Shader(new ShaderByteCode());
		this.contrast = contrast;
		this.lightness = lightness;
		this.shader = _shader;
	}
	
	/**
	 * Increases or decreases the filtered image lightness. 
	 * <p>Valid values ar between <code class="prettyprint">-100</code> 
	 * and <code class="prettyprint">100</code>.</p>
	 */
	public function get lightness():int
	{
		return this.shader.data.lightness.value[0];
	}
	
	/**
	 * @private
	 */
	public function set lightness(value:int):void
	{
		_shader.data.lightness.value[0] = Math.max(minLightness,Math.min(value,maxLightness));
		this.shader = _shader;
	}
	
	/**
	 * Increases or decreases the filtered image contrast. 
	 * <p>Valid values ar between <code class="prettyprint">-100</code> 
	 * and <code class="prettyprint">100</code>.</p>
	 */
	public function get contrast():int
	{
		return this.shader.data.contrast.value[0];
	}
	
	/**
	 * @private
	 */
	public function set contrast(value:int):void
	{
		_shader.data.contrast.value[0] = Math.max(minContrast,Math.min(value,maxContrast));
		this.shader = _shader;
	}
	
	override public function clone():BitmapFilter
	{
		return new ContrastLightnessFilter(contrast, lightness);
	}
	
}
	
}
