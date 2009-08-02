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
 * The <code class="prettyprint">ContrastLightnessFilter</code> class allows 
 * filtering display objects by adjusting their lightness and contrast. 
 * It behaves like Photoshop's Lightness/Contrast adjustement.
 * 
 * <p>The lightness defines the global amount of white in an image. 
 * High values will lead to images with lots of white/light areas and 
 * low values will lead to images with lots of black/dark areas.</p>
 * 
 * <p>The contrast defines the chromatic gap between pixels in a image.
 * Low values will lead to gray and dull images, while high values will 
 * lead to over-saturated images.</p>
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
public class ContrastLightnessFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="ContrastLightnessFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
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
		this.shader = new Shader(new ShaderByteCode());
		this.contrast = contrast;
		this.lightness = lightness;
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
		this.shader.data.lightness.value[0] = value;
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
		this.shader.data.contrast.value[0] = value;
	}
	
	/**
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new ContrastLightnessFilter(contrast, lightness);
	}
	
}
	
}
