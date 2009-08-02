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
	import stdpx.types.ChannelTransform;
	
	import flash.display.Shader;
	
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;

/**
 * The ChannelMixerFilter allows you to mix RGBA channels of an image.
 * Using a ChannelTransform object, you can swap channels between them, 
 * apply offsets or make a more sophisticated linear combination of all channels.
 * 
 * <p>Alternatively, you may pass a raw array of numbers for the combination of channels and the offsets, to configure the channel mixing.
 * To know how to organize those arrays, see the ChannelTransform class : their raw arrays work the same.</p>
 */
public class ChannelMixerFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="ChannelMixerFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 * 
	 * @param transform a ChannelTransform object that will mix the channels
	 */
	public function ChannelMixerFilter(
				transform:ChannelTransform = null
			) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this.transform = transform ? transform : new ChannelTransform();	
	}
	
	/**
	 * @private
	 */
	private var _transform:ChannelTransform;
	
	/**
	 * A ChannelTransform object that will mix the channels.
	 */
	public function get transform():ChannelTransform
	{
		return _transform;
	}
	
	/**
	 * @private
	 */
	public function set transform(value:ChannelTransform):void
	{
		this._transform = value.clone();
		this.shader.data.combination.value = _transform.rawChannelData;
		this.shader.data.offset.value = _transform.rawOffsetData;
	}
	
	/**
	 * An array of 16 numbers to mix the channels.
	 */
	public function set combination(value:Array):void
	{
		this.shader.data.combination.value = value.slice(0,16);
	}
	
	/**
	 * An array of 4 numbers to offset the channels.
	 */
	public function set offset(value:Array):void
	{
		this.shader.data.offset.value = value.slice(0,4);
	}
	
	/**
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new ChannelMixerFilter(_transform);
	}
	
}
	
}
