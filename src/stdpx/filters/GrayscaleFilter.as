package stdpx.filters 
{
	import flash.display.Shader;
	
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;
	
	import stdpx.types.ShaderMetadata;
	import stdpx.types.IMetadataAttachedShader;

/** 
 * The GrayscaleFilter turns an image into levels of gray.
 * The image becomes monochromatic.
 * 
 * <p>There are several ways to turn an image into levels of gray : 
 * <ol>
 * 		<li>Using the V (Value) component of the HSV color model.</li>
 * 		<li>Using the L (Value) component of the HSL color model.</li>
 * 		<li>Using luminances.</li>
 * </ol>
 * <br/>
 * The GrayscaleFilter uses the third method. Luminances used for RGB are 
 * respectively 0.3086, 0.6094 and 0.0820.
 * </p>
 *
 */
public class GrayscaleFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="GrayscaleFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 * 
	 * @param intensity The strength of the grayscale effect. 
	 */
	public function GrayscaleFilter(intensity:Number = 1) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this.intensity = intensity;
	}
	
	/**
	 * The strength of the grayscale effect. 
	 * Values are floating numbers between 0 and 1.
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
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new GrayscaleFilter(intensity);
	}
	
}
	
}
