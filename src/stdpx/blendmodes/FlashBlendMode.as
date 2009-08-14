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

package stdpx.blendmodes 
{
	import flash.display.Shader;

public class FlashBlendMode 
{
	
	
	/**
	 * 
	 */
	public static function get ADD():Shader
	{
		return new BlendModeAdd();
	}
	
	/**
	 * Layer blendmode for parent layer
	 */
	public static function get ALPHA():Shader
	{
		return new BlendModeAlpha();
	}
	
	/**
	 * 
	 */
	public static function get DARKEN():Shader
	{
		return new BlendModeDarken();
	}
	
	/**
	 * 
	 */
	public static function get DIFFERENCE():Shader
	{
		return new BlendModeDifference();
	}
	
	/**
	 * Layer blendmode for parent layer
	 */
	public static function get ERASE():Shader
	{
		return new BlendModeErase();
	}
	
	/**
	 * 
	 */
	public static function get HARDLIGHT():Shader
	{
		return new BlendModeHardLight();
	}
	
	/**
	 * 
	 */
	public static function get LIGHTEN():Shader
	{
		return new BlendModeLighten();
	}
	
	/**
	 * 
	 */
	public static function get MULTIPLY():Shader
	{
		return new BlendModeMultiply();
	}
	
	/**
	 * Useless in production. Created only for testing purpose.
	 */
	public static function get NORMAL():Shader
	{
		return new BlendModeNormal();
	}
	
	/**
	 * 
	 */
	public static function get OVERLAY():Shader
	{
		return new BlendModeOverlay();
	}
	
	/**
	 * 
	 */
	public static function get SCREEN():Shader
	{
		return new BlendModeScreen();
	}
	
	/**
	 * 
	 */
	public static function get SUBTRACT():Shader
	{
		return new BlendModeSubtract();
	}
	
	
	
}
	
}
