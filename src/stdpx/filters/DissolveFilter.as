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
 * A DissolveFilter performs operations on transparent pixels of an image.
 * 
 * <p>In a dissolved image, pixels can only be fully transparent or fully opaque.
 * The more the pixel is transparent, the higher is its chance to become fully transparent.
 * The more the pixel is opaque, the higher is its chance to become fully opaque.</p>
 */
public class DissolveFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="DissolveFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 * 
	 * @param seed A value changing the way noise 
	 * pixels are generated around transparent areas. 
	 */
	public function DissolveFilter(seed:uint = 127) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this.seed = seed;
	}
	
	/**
	 * A value changing the way noise pixels are generated around transparent areas. 
	 * <p>Typical values are integers between 1 and 255, 
	 * although there is no upper bound to them.</p>
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
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		var filter:DissolveFilter = new DissolveFilter();
		filter.seed = this.seed;
		return filter;
	}
	
}
	
}
