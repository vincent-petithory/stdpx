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

package stdpx.jobs 
{
	import stdpx.types.ShaderMetadata;
	import stdpx.types.IMetadataAttachedShader;
	import flash.display.Shader;
	import flash.display.ShaderData;

/**
 * The <code class="prettyprint">HSVColorJob</code> produces 
 * colors in the HSL color space.
 * 
 * <p>A HSL based color has three parameters : 
 * <ul>
 * 		<li>hue; values are integers in [0,360]</li>
 * 		<li>saturation; values are integers in [0,100]</li>
 * 		<li>lightness; values are integers in [0,100]</li>
 * </ul>
 * Vectors or ByteArrays you provide as input must contain sets of three values.
 * </p>
 * 
 * <strong>Example :</strong>
 * <pre class="prettyprint">
 * * The following examples generates 360 random colors in the HSL Space,
 * then draws them in a Shape object. The input is a Vector.
 * 
 * const NUM_COLORS:int = 360;
 * var vectorColors:Vector.<Number> = new Vector.<Number>(NUM_COLORS*3,true);
 * 
 * var i:int = 0;
 * while (i/3<NUM_COLORS)
 * {
 * 	// sets hue
 * 	vectorColors[i++] = i/3;
 * 	// sets saturation
 * 	vectorColors[i++] = 100;
 * 	// sets value
 * 	vectorColors[i++] = 100;
 * }
 * 
 * var job:HSLColorJob = new HSLColorJob();
 * job.byteArray = byteColors;
 * // calculation is done synchronously.
 * job.start(true);
 * 
 * var colors:Vector.<uint> = job.getColors();
 * 
 * var shape:Shape = new Shape();
 * addChild(shape);
 * var j:int = 0;
 * for each (var color:uint in colors)
 * {
 * 	shape.graphics.beginFill(color);
 * 	shape.graphics.drawRect(j,0,1,200);
 * 	shape.graphics.endFill();
 * 	j++;
 * }
 * </pre>
 */
public class HSLColorJob extends BaseColorJob implements IMetadataAttachedShader 
{
	
	/**
	 * @private
	 * The bytecode of the shader.
	 */
	[Embed(	source="HSLColorJob.pbj", 
			mimeType="application/octet-stream")]
	private static var ShaderByteCode:Class;
	
	include "../types/metadata.as";
	
	/**
	 * Constructor.
	 */
	public function HSLColorJob() 
	{
		super(new ShaderByteCode(),3);
	}
	
}
	
}
