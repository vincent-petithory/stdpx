package stdpx.filters 
{
	import flash.display.Shader;
	
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;
	
	import flash.geom.Point;
	
	import stdpx.types.ShaderMetadata;
	import stdpx.types.IMetadataAttachedShader;

/**
 * The <code class="prettyprint">ZoomLinearFilter</code> allows to zoom at 
 * a point of the filtered image.
 */
public class ZoomLinearFilter extends ShaderFilter implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="ZoomLinearFilter.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 * 
	 * @param zoom The strength of the zoom. 
	 * @param refPoint a point specified where to zoom in the image.
	 */
	public function ZoomLinearFilter(zoom:Number = 1.0, refPoint:Point = null) 
	{
		super();
		this.shader = new Shader(new ShaderByteCode());
		this.zoom = zoom;
		this.refPoint = refPoint;
	}
	
	/**
	 * The strength of the zoom. 
	 * <p>A value of 2.0 will create a zoom 2x.</p>
	 */
	public function get zoom():Number
	{
		return this.shader.data.zoom.value[0];
	}
	
	/**
	 * @private
	 */
	public function set zoom(value:Number):void
	{
		this.shader.data.zoom.value[0] = value;
	}
	
	/**
	 * The point to zoom at. 
	 * The point specified will be the upper 
	 * left corner of the zoomed image.
	 */
	public function get refPoint():Point
	{
		return new Point(this.shader.data.ref.value[0],this.shader.data.ref.value[1]);
	}
	
	/**
	 * @private
	 */
	public function set refPoint(value:Point):void
	{
		if (value)
			this.shader.data.ref.value = [value.x,value.y];
	}
	
	/**
	 * The point to zoom at. The specified array 
	 * must contain 2 values.
	 * The point specified will be the upper 
	 * left corner of the zoomed image.
	 */
	public function set ref(value:Array):void
	{
		this.shader.data.ref.value = value.slice(0,2);
	}
	
	/**
	 * Returns a clone of this filter.
	 * @return a clone of this filter.
	 */
	override public function clone():BitmapFilter
	{
		return new ZoomLinearFilter(zoom,refPoint);
	}
	
}
	
}
