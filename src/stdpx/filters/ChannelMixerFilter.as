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
	import stdpx.types.ChannelTransform;
	
	import flash.display.Shader;
	import flash.display.ShaderData;
	
	import flash.filters.ShaderFilter;
	
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;

public class ChannelMixerFilter extends ShaderFilter 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="ChannelMixerFilter.pbj", 
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
	 * @private
	 */
	private static var _shaderData:ShaderData;
	
	/**
	 * @private
	 */
	private static function get shaderData():ShaderData
	{
		if (!shaderData)
		{
			_shaderData = new Shader(new ShaderByteCode()).data;
		}
		return shaderData;
	}
	
	private var _transform:ChannelTransform;
	
	public function ChannelMixerFilter(
				transform:ChannelTransform = null
			) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this._transform = transform ? transform : new ChannelTransform();	
		
		this.shader.data.rgbaModifier.value = _transform.rawChannelData;
		this.shader.data.offset.value = _transform.rawOffsetData;
	}
	
	public function set transform(value:ChannelTransform):void
	{
		this._transform = value.clone();
	}
	
	public function get transform():ChannelTransform
	{
		return _transform;
	}
	
}
	
}
