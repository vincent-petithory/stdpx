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
	import flash.display.Shader;
	import flash.display.ShaderData;
	import flash.display.ShaderJob;
	import flash.display.ShaderParameter;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ShaderEvent;
	import flash.filters.ShaderFilter;
	import flash.utils.ByteArray;
	import flash.utils.Endian;

[Event(name="complete", type="flash.events.Event")]
[Event(name="cancel", type="flash.events.Event")]

/**
 * This is the base class of all Pixel Bender jobs that produce 
 * colors in a given color space.
 */
public class BaseColorJob extends EventDispatcher 
{
	
	/**
	 * A reference to the internal shader.
	 */
	protected var $shader:Shader;
	
	/**
	 * The number of channels (or components) of 
	 * the output color space.
	 */
	protected var $numChannels:uint;
	
	/**
	 * Constructor.
	 * 
	 * @param code the byte code of the shader that 
	 * will perform the calculation.
	 * @param numChannels The number of channels (or components) of 
	 * the output color space.
	 */
	public function BaseColorJob(code:ByteArray, numChannels:uint) 
	{
		super();
		this.$shader = new Shader(code);
		this.$numChannels = numChannels;
	}
	
	/**
	 * The bytearray containing 
	 * the values of the color space components.
	 * The provided byte array endian must be little endian.
	 * 
	 * To produce one output color, the bytearray must contain as much values as 
	 * the number of components of the output color space.
	 * You may use the writeFloat() method to add values to the byte array.
	 */
	public function set byteArray(value:ByteArray):void
	{
		if (value.endian != Endian.LITTLE_ENDIAN)
		{
			throw new ArgumentError("Incorrect endian : The byte array must be in little endian");
		}
		value.position = 0;
		$shader.data.src.width = value.length / ($numChannels*4);
		$shader.data.src.height = 1;
		$shader.data.src.input = value;
		
		$byteArray = new ByteArray();
		$byteArray.endian = Endian.LITTLE_ENDIAN;
		
		$vector = null;
	}
	
	/**
	 * The vector containing 
	 * the values of the color space components.
	 * 
	 * To produce one output color, the vector must contain as much values as 
	 * the number of components of the output color space.
	 */
	public function set vector(value:Vector.<Number>):void
	{
		var l:int = value.length;
		if (l % $numChannels != 0)
		{
			throw new ArgumentError("Mismatch number of parameters. Parameters must be by group of "+$numChannels+".");
		}
		$shader.data.src.width = l/$numChannels;
		$shader.data.src.height = 1;
		$shader.data.src.input = value;
		
		$vector = new Vector.<Number>();
		
		$byteArray = null;
	}
	
	/**
	 * The internal shader job.
	 */
	protected var $job:ShaderJob;
	
	/**
	 * The internal byte array of output values.
	 * It will contain the result if the input is a byte array.
	 */
	protected var $byteArray:ByteArray;
	
	/**
	 * The internal vector of output values.
	 * It will contain the result if the input is a vector.
	 */
	protected var $vector:Vector.<Number>;
	
	/**
	 * @private
	 */
	private var colors:Vector.<uint>;
	
	/**
	 * Returns the colors calculated by this job.
	 * @return the colors calculated by this job.
	 */
	public function getColors():Vector.<uint>
	{
		if (!colors)
		{
			var v:Vector.<uint>;
			var l:int;
			var color:Number;
			var i:int;
			if ($byteArray)
			{
				l = $byteArray.length/4;
				v = new Vector.<uint>(l/$numChannels,true);
				$byteArray.position = 0;
				i = 0;
				while ($byteArray.bytesAvailable > 0)
				{
					color = $byteArray.readFloat();
					if (i % $numChannels == 0)
					{
						v[i/$numChannels] = uint(color);
					}
					i++;
				}
			}
			else if ($vector)
			{
				
				l = $vector.length;
				v = new Vector.<uint>(l/$numChannels,true);
				i = -1;
				
				while (++i < l)
				{
					if (i % $numChannels == 0)
					{
						v[i/$numChannels] = uint($vector[i]);
					}
				}
				
			}
			this.colors = v;
		}
		return colors;
	}
	
	/**
	 * Cancels the current calculation.
	 * Dispatches a Event.CANCEL event if 
	 * there was a calculation to cancel.
	 */
	public function cancel():void
	{
		if ($job)
		{
			$job.cancel();
			this.dispatchEvent(new Event(Event.CANCEL,false,false));
		}
	}
	
	/**
	 * Starts a new calculation.
	 * @param waitForCompletion whether the operation is synchronous or asynchronous.
	 * if <code class="prettyprint">true</code>, it is synchronous. 
	 * Otherwise, it is asynchronous and will dispatch a Event.COMPLETE event when completed.
	 */
	public function start(waitForCompletion:Boolean = false):void
	{
		$job = new ShaderJob($shader,$byteArray ? $byteArray : $vector,$shader.data.src.width,1);
		if (!waitForCompletion) $job.addEventListener(ShaderEvent.COMPLETE, $onShaderComplete);
		$job.start(waitForCompletion);
	}
	
	/**
	 * Called when an asynchronous calculation is completed.
	 * @param event The event object related to the completion event.
	 */
	protected function $onShaderComplete(event:ShaderEvent):void 
	{
		$job.removeEventListener(ShaderEvent.COMPLETE, $onShaderComplete);
		this.dispatchEvent(new Event(Event.COMPLETE, false, false));
	}
	
}
	
}
