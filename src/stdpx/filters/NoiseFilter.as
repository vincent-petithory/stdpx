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
	import flash.display.ShaderData;
	
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;

/**
 * The NoiseFilter adds noise to an image. 
 * You can control how much noise you want to add. A seed value is provided 
 * so that you can animate the noise (think about a noisy tv screen).
 */
public class NoiseFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="NoiseFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 * 
	 * @param seed a value changing the noise generation.
	 * @param amount the amount of noise to add. 
	 */
	public function NoiseFilter(seed:uint = 127, amount:Number = 0.01) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this.seed = seed;
		this.amount = amount;
	}
	
	/**
	 * A value changing the way noise pixels are generated, 
	 * without changing the amount of noise. 
	 * <p>Typical values are integers between 1 and 255, although there is no upper bound to them.</p>
	 */
	public function get seed():uint
	{
		return this.shader.data.seed.value[0];
	}
	
	/**
	 * @private
	 */
	public function set seed(value:uint):void
	{
		this.shader.data.seed.value[0] = value;
	}
	
	/**
	 * The amount of noise in the image.
	 * <p>Typical values are floats between 0 and 4.</p>
	 */
	public function get amount():Number
	{
		return this.shader.data.amount.value[0];
	}
	
	/**
	 * @private
	 */
	public function set amount(value:Number):void
	{
		this.shader.data.amount.value[0] = value;
	}
	
	/**
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new NoiseFilter();
	}
	
}
	
}
