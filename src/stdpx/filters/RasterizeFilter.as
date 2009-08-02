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
 * The RasterizeFilter pixelates an image. Each pixel will appear bigger. 
 * You can specify the size of a pixel.
 */
public class RasterizeFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="RasterizeFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 * @param width The width in pixel of a color square
	 * @param height The height in pixel of a color square
	 */
	public function RasterizeFilter(width:Number = 5, height:Number = 5) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this.size = [width,height];
	}
	
	/**
	 * The size in pixel of color square. 
	 * You may pass an array of 2 values. The first value is the width of 
	 */
	public function get size():Array
	{
		return this.shader.data.size.value;
	}
	
	/**
	 * @private
	 */
	public function set size(value:Array):void
	{
		this.shader.data.size.value = value.slice(0,2);
	}
	
	/**
	 * Sets both the width and height of a color square.
	 */
	public function set size2(value:Number):void
	{
		this.shader.data.size.value = [value,value];
	}
	
	/**
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new RasterizeFilter(size[0],size[1]);
	}
	
}
	
}
