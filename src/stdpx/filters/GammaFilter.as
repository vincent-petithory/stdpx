package stdpx.filters 
{
	import flash.display.Shader;
	
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;
	
	import stdpx.types.ShaderMetadata;
	import stdpx.types.IMetadataAttachedShader;

/**
 * The GammaFilter adjusts the `gamma` of the image. 
 * It is useful to change the global lighting of the image.
 */
public class GammaFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="GammaFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 * 
	 * @param gamma The 'gamma' of the image. 
	 */
	public function GammaFilter(gamma:Number = 1.0) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this.gamma = gamma;
	}
	
	/**
	 * The new gamma of the image. 
	 * <p>Practical values are in interval <code>[0.01, 5]</code>. 
	 * 1 is the neutral value.</p>
	 */
	public function get gamma():Number
	{
		return this.shader.data.gamma.value[0];
	}
	
	/**
	 * @private
	 */
	public function set gamma(value:Number):void
	{
		this.shader.data.gamma.value[0] = value;
	}
	
	/**
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new GammaFilter(gamma);
	}
	
}
	
}
