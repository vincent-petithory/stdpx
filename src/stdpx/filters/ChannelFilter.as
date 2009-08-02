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
 * The ChannelFilter allows you to keep or dismiss RGBA channels of an image.
 * If you want a better control of channels mixing, use the stdpx.filters.ChannelMixelFilter.
 * 
 * @see ChannelMixelFilter
 * 
 */
public class ChannelFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="ChannelFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 * 
	 * @param keepRed The red channel state. 
	 * @param keepGreen The green channel state. 
	 * @param keepBlue The blue channel state. 
	 * @param keepAlpha The alpha channel state. 
	 */
	public function ChannelFilter(
								keepRed:Boolean = true, 
								keepGreen:Boolean = true, 
								keepBlue:Boolean = true, 
								keepAlpha:Boolean = true
							) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this.keepRed = keepRed;
		this.keepGreen = keepGreen;
		this.keepBlue = keepBlue;
		this.keepAlpha = keepAlpha;
	}
	
	/**
	 * The state of the RGBA channels. Pass an array of four values of either 0 or 1.
	 * 0 will dismiss the corresponding channel.
	 * 1 will keep the corresponding channel.
	 */
	public function set channels(value:Array):void
	{
		this.shader.data.channels.value = value.slice(0,4);
	}
	
	/**
	 * The red channel state. 
	 * If true, it is kept. if false, it is dismissed.
	 */
	public function get keepRed():Boolean
	{
		return this.shader.data.channels.value[0] == 1;
	}
	
	/**
	 * @private
	 */
	public function set keepRed(value:Boolean):void
	{
		this.shader.data.channels.value[0] = value ? 1 : 0;
	}
	
	/**
	 * The green channel state. 
	 * If true, it is kept. if false, it is dismissed.
	 */
	public function get keepGreen():Boolean
	{
		return this.shader.data.channels.value[1] == 1;
	}
	
	/**
	 * @private
	 */
	public function set keepGreen(value:Boolean):void
	{
		this.shader.data.channels.value[1] = value ? 1 : 0;
	}
	
	/**
	 * The blue channel state. 
	 * If true, it is kept. if false, it is dismissed.
	 */
	public function get keepBlue():Boolean
	{
		return this.shader.data.channels.value[2] == 1;
	}
	
	/**
	 * @private
	 */
	public function set keepBlue(value:Boolean):void
	{
		this.shader.data.channels.value[2] = value ? 1 : 0;
	}
	
	/**
	 * The alpha channel state. 
	 * If true, it is kept. if false, it is dismissed.
	 */
	public function get keepAlpha():Boolean
	{
		return this.shader.data.channels.value[3] == 1;
	}
	
	/**
	 * @private
	 */
	public function set keepAlpha(value:Boolean):void
	{
		this.shader.data.channels.value[3] = value ? 1 : 0;
	}
	
	/**
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new ChannelFilter(keepRed,keepGreen,keepBlue,keepAlpha);
	}
	
}
	
}
