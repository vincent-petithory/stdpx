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
	
	import flash.display.BitmapData;
	
	import flash.display.Shader;
	
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;

/**
 * The LayerMaskFilter takes a mask and applies it to the image.
 * 
 * <p>A black pixel of the mask causes the corresponding pixel of the image to be transparent.<br/>
 * A white pixel of the mask causes the corresponding pixel of the image to be opaque.<br/>
 * A gray pixel of the mask causes a part-transparent pixel in the image.</p>
 * 
 * This technique is commonly knowed as layer masking.
 * 
 */
public class LayerMaskFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="LayerMaskFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 * 
	 * @param mask The mask to apply.
	 */
	public function LayerMaskFilter(mask:BitmapData) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this.mask = mask;
	}
	
	/**
	 * @private
	 */
	private var _mask:BitmapData;
	
	/**
	 * The mask to apply. 
	 * A black pixel of the mask causes the corresponding pixel of the image to be transparent.
	 * A white pixel of the mask causes the corresponding pixel of the image to be opaque.
	 * A gray pixel of the mask causes a part-transparent pixel in the image.
	 */
	public function get mask():BitmapData
	{
		return _mask;
	}
	
	/**
	 * @private
	 */
	public function set mask(value:BitmapData):void
	{
		this._mask = value.clone();
		this.shader.data.mask.input = _mask;
	}
	
	/**
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new LayerMaskFilter(_mask);
	}
	
}
	
}
