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

public final class StdpxBlendMode 
{
	
	/**
	 * 
	 */
	public static function get AVERAGE():Shader
	{
		return new BlendModeAverage();
	}
	
	/**
	 * 
	 */
	public static function get COLOR():Shader
	{
		return new BlendModeColor();
	}
	
	/**
	 * 
	 */
	public static function get COLOR_BURN():Shader
	{
		return new BlendModeColorBurn();
	}
	
	/**
	 * 
	 */
	public static function get COLOR_DODGE():Shader
	{
		return new BlendModeColorDodge();
	}
	
	/**
	 * 
	 */
	public static function get DARKER_COLOR():Shader
	{
		return new BlendModeDarkerColor();
	}
	
	/**
	 * FIXME
	 * Compatibilité pixel bender / flash player 10
	 */
	public static function get DISSOLVE():Shader
	{
		return new BlendModeDissolve();
	}
	
	/**
	 * Similar to difference but with lower contrast
	 */
	public static function get EXCLUSION():Shader
	{
		return new BlendModeExclusion();
	}
	
	/**
	 * 
	 */
	public static function get HARD_MIX():Shader
	{
		return new BlendModeHardMix();
	}
	
	/**
	 * 
	 */
	public static function get HUE():Shader
	{
		return new BlendModeHue();
	}
	
	/**
	 * Similar to difference but with lower contrast
	 */
	public static function get INCLUSION():Shader
	{
		return new BlendModeInclusion();
	}
	
	/**
	 * 
	 */
	public static function get INVERT_AVERAGE():Shader
	{
		return new BlendModeInvertAverage();
	}
	
	/**
	 * 
	 */
	public static function get LIGHTER_COLOR():Shader
	{
		return new BlendModeLighterColor();
	}
	
	/**
	 * 
	 */
	public static function get LINEAR_BURN():Shader
	{
		return new BlendModeLinearBurn();
	}
	
	/**
	 * 
	 */
	public static function get LINEAR_DODGE():Shader
	{
		return new BlendModeLinearDodge();
	}
	
	/**
	 * 
	 */
	public static function get LINEAR_LIGHT():Shader
	{
		return new BlendModeLinearLight();
	}
	
	/**
	 * 
	 */
	public static function get LUMA():Shader
	{
		return new BlendModeLuma();
	}
	
	/**
	 * 
	 */
	public static function get LUMINOSITY():Shader
	{
		return new BlendModeLuminosity();
	}
	
	/**
	 * Similar to difference but with lighter colors
	 */
	public static function get NEGATION():Shader
	{
		return new BlendModeNegation();
	}
	
	/**
	 * 
	 */
	public static function get PIN_LIGHT():Shader
	{
		return new BlendModePinLight();
	}
	
	/**
	 * 
	 */
	public static function get SATURATION():Shader
	{
		return new BlendModeSaturation();
	}
	
	/**
	 * 
	 */
	public static function get SEE_THROUGH():Shader
	{
		return new BlendModeSaturation();
	}
	
	/**
	 * 
	 */
	public static function get SOFTLIGHT():Shader
	{
		return new BlendModeSoftLight();
	}
	
	/**
	 * 
	 */
	public static function get VIVID_LIGHT():Shader
	{
		return new BlendModeVividLight();
	}
	
	
	
}
	
}
