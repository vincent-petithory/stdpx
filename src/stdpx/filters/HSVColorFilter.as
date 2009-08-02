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
	import stdpx.types.IMetadataAttachedShader;
	
	import flash.display.Shader;
	
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;

/**
 * The HSVColorFilter allows you to change 
 * the hue, saturation and value of an image. 
 * 
 * <p>This is a common tool you find on all image manipulation softwares.<br/>
 * For a given pixel :
 * <ul>
 * 		<li>The hue is its general color, like red, blue, yellow, etc.</li>
 * 		<li>The saturation is the strength of the hue. Low values tends 
 * to pastel colors/gray. High values tends to vivid colors.</li>
 * 		<li>The value is its (non-linear) lightness. Low values tends to 
 * dark/black colors. High values tends to bright/white colors.
 * It is similar to the common lightness, but adapted to the eye non-linearity perception.</li>
 * </ul>
 * </p>
 * 
 */
public class HSVColorFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="HSVColorFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 *
	 * @param hue The variation of hue to apply.
	 * @param saturation The variation of saturation to apply.
	 * @param value The variation of value to apply.
	 */
	public function HSVColorFilter(hue:int = 0, saturation:int = 0, value:int = 0) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this.hue = hue;
		this.saturation = saturation;
		this.value = value;
	}
	
	/**
	 * The variation of hue to apply. 
	 * Typical values are between -180 and 180.
	 * A value of 0 does not 
	 * modify the hue of the image.
	 */
	public function get hue():int
	{
		return this.shader.data.hue.value[0];
	}
	
	/**
	 * @private
	 */
	public function set hue(value:int):void
	{
		this.shader.data.hue.value[0] = value;
	}
	
	/**
	 * The variation of saturation to apply. 
	 * Typical values are between -100 and 100.
	 * A value of 0 does not 
	 * modify the saturation of the image.
	 */
	public function get saturation():int
	{
		return this.shader.data.saturation.value[0];
	}
	
	/**
	 * @private
	 */
	public function set saturation(value:int):void
	{
		this.shader.data.saturation.value[0] = value;
	}
	
	/**
	 * The variation of value to apply. 
	 * Typical values are between -180 and 180.
	 * A value of 0 does not 
	 * modify the hue of the image.
	 */
	public function get value():int
	{
		return this.shader.data.value.value[0];
	}
	
	/**
	 * @private
	 */
	public function set value(value:int):void
	{
		this.shader.data.value.value[0] = value;
	}
	
	/**
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new HSVColorFilter(hue,saturation,value);
	}
	
}
	
}
