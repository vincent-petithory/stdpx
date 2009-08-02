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
	
	import flash.geom.Point;

/**
 * The LightingFilter creates an omni light source in the image. 
 */
public class LightingFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="LightingFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 * 
	 * @param exposition The global exposition of the image
	 * @param lightposition The position of the light source
	 * @param range The range of the light source
	 * @param attenuation The attenuation of the light source
	 * @param lightcolor The color of the light source
	 * @param intensity The color intensity of the light source
	 * @param lighting The strength of the light source
	 * @param globalillumination The global ambient lighting of the image 
	 */
	public function LightingFilter(
							exposition:Number = 0, 
							lightposition:Array = null, 
							range:Array = null, 
							attenuation:Number = 0.0001, 
							lightcolor:uint = 0xffffff, 
							intensity:Number = 0.0, 
							lighting:Number = 0.0, 
							globalillumination:Number = 0.0
						) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this.exposition = exposition;
		this.lightposition = lightposition ==  null ? [0,0] : lightposition.slice(0,2);
		this.range = range ==  null ? [0,0] : range.slice(0,2);
		this.attenuation = attenuation;
		this.lightcolorHex = lightcolor;
		this.intensity = intensity;
		this.lighting = lighting;
		this.globalillumination = globalillumination;
	}
	
	/**
	 * The global exposition of the image.
	 * <p>Values are floating numbers between -1 and 1.
	 * -1 darkens the image.
	 * 1 lightens the image.
	 * 0 keeps it unmodified.</p>
	 */
	public function get exposition():Number
	{
		return this.shader.data.exposition.value[0];
	}
	
	/**
	 * @private
	 */
	public function set exposition(value:Number):void
	{
		this.shader.data.exposition.value[0] = value;
	}
	
	/**
	 * The position of the light source.
	 * <p>You may pass an array of two values. 
	 * The first value is the position on the x-axis. 
	 * The second value is the position on the y-axis.
	 * All values are in pixels.</p>
	 * 
	 */
	public function get lightposition():Array
	{
		return this.shader.data.lightposition.value;
	}
	
	/**
	 * @private
	 */
	public function set lightposition(value:Array):void
	{
		this.shader.data.lightposition.value = value.slice(0,2);
	}
	
	/**
	 * The position of the light source.
	 */
	public function set lightpositionPoint(value:Point):void
	{
		this.shader.data.lightposition.value = [value.x,value.y];
	}
	
	/**
	 * The range of the light source.
	 * <p>You may pass an array of two values. 
	 * The first value is the horizontal range.
	 * The second value is the vertical range.
	 * All values are in pixels.<br/>
	 * Typically, you will pass the size of the 
	 * image to be filtered.</p>
	 * 
	 */
	public function get range():Array
	{
		return this.shader.data.range.value;
	}
	
	/**
	 * @private
	 */
	public function set range(value:Array):void
	{
		this.shader.data.range.value = value.slice(0,2);
	}
	
	/**
	 * The range of the light source.
	 */
	public function set rangePoint(value:Point):void
	{
		this.shader.data.range.value = [value.x,value.y];
	}
	
	/**
	 * The attenuation of the light source.
	 * <p>Values are floating numbers stricty greater than 0.
	 * The higher the value, the higher the light is attenuated.
	 * The attenuation is hyperbolic.</p>
	 */
	public function get attenuation():Number
	{
		return this.shader.data.attenuation.value[0];
	}
	
	/**
	 * @private
	 */
	public function set attenuation(value:Number):void
	{
		this.shader.data.attenuation.value[0] = value;
	}
	
	/**
	 * The color of the light source.
	 * <p>Values are floating numbers between 0 and 1.
	 * You may pass an array of 3 values : one per channel (RGB)
	 * For a channel, 0 is 0, and 1 is 255 (0xff).</p>
	 * 
	 * @see #lightcolorHex
	 */
	public function get lightcolor():Array
	{
		return this.shader.data.lightcolor.value;
	}
	
	/**
	 * @private
	 */
	public function set lightcolor(value:Array):void
	{
		this.shader.data.lightcolor.value = value.slice(0,3);
	}
	
	/**
	 * The color of the light source. 
	 * 
	 * @see #lightcolor
	 */
	public function get lightcolorHex():uint 
	{
		var c:Array = this.shader.data.lightcolor.value;
		return (c[0] << 16) + (c[1] << 9) + (c[2]);
	}
	
	/**
	 * @private
	 */
	public function set lightcolorHex(value:uint):void
	{
		this.shader.data.lightcolor.value = [(value >> 16) & 0xff, (value >> 8) & 0xff, (value) & 0xff];
	}
	
	/**
	 * The color intensity of the light source.
	 * <p>Values are floating numbers between 0 and 1.
	 * Higher values causes a more powerful lamp.</p>
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
		this.shader.data.intensity.value[0] = value;
	}
	
	/**
	 * The strength of the light source.
	 * <p>Values are floating numbers stricty greater than 0.
	 * Low values causes the light to mix with the background, 
	 * causing a hushed atmosphere.</p>
	 */
	public function get lighting():Number
	{
		return this.shader.data.lighting.value[0];
	}
	
	/**
	 * @private
	 */
	public function set lighting(value:Number):void
	{
		this.shader.data.lighting.value[0] = value;
	}
	
	/**
	 * The global ambient lighting of the image.
	 * <p>Values are floating numbers between 0 and 1.
	 * 0 does not add global lighting.
	 * 1 lightens the image with its own light.</p>
	 */
	public function get globalillumination():Number
	{
		return this.shader.data.globalillumination.value[0];
	}
	
	/**
	 * @private
	 */
	public function set globalillumination(value:Number):void
	{
		this.shader.data.globalillumination.value[0] = value;
	}

	/**
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new LightingFilter(exposition,lightposition,range,attenuation,lightcolorHex,intensity,lighting,globalillumination);
	}
	
}
	
}
