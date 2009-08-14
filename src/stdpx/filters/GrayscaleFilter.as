package stdpx.filters 
{
	import flash.display.Shader;
	import flash.display.ShaderData;
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;
	import stdpx.types.ShaderMetadata;

public class GrayscaleFilter extends ShaderFilter 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="GrayscaleFilter.pbj", 
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
	
	public static function get minIntensity():Number
	{
		return shaderData.intensity.minValue[0];
	}
	
	public static function get maxIntensity():Number
	{
		return shaderData.intensity.maxValue[0];
	}
	
	public static function get defaultIntensity():Number
	{
		return shaderData.intensity.defaultValue[0];
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
		if (!_shaderData)
		{
			_shaderData = new Shader(new ShaderByteCode()).data;
		}
		return _shaderData;
	}
	
	/**
	 * @private
	 * A reference to the internal shader.
	 */
	private var _shader:Shader;
	
	public function GrayscaleFilter(intensity:Number = 1) 
	{
		super();
		_shader = new Shader(new ShaderByteCode());
		this.intensity = intensity;
		this.shader = _shader;
	}
	
	/**
	 * 
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
		_shader.data.intensity.value[0] = Math.max(minIntensity,Math.min(value,maxIntensity));
		this.shader = _shader;
	}
	
	override public function clone():BitmapFilter
	{
		return new GrayscaleFilter(intensity);
	}
	
}
	
}
