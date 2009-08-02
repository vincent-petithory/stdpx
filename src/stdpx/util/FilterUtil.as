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

package stdpx.util 
{

	import flash.display.DisplayObject;
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
/**
 * The <code class="prettyprint">FilterUtil</code> class defines methods 
 * to manipulate filters applied to any <code class="prettyprint">DisplayObject</code>.
 */
public final class FilterUtil 
{
	
	/**
	* Removes duplicate filter types in the filters array of a display object.
	* Filters that extends ShaderFilter are not processed 
	* (since Flash Player does not keep the real type of a filter that extends ShaderFilter)
	* 
	* @param filter The filter to search for duplicates.
	* @param displayObject The DisplayObject which may own such a filter.
	* @return The array of filters of the specified DisplayObject 
	* with all duplicates of the specified filter removed.
	*/
	public static function removeDuplicates(filter:BitmapFilter, displayObject:DisplayObject):Array
	{
		var removedSome:Boolean = false;
		var filters:Array = displayObject.filters;
		try 
		{
			var qfn:String = getQualifiedClassName(filter);
			var FilterType:Class = getDefinitionByName(qfn) as Class;
			if (qfn == getQualifiedClassName(ShaderFilter))
			{
				return filters;
			}
			var n:int = filters.length;
			
			while (--n>-1)
			{
				if (filters[n] is FilterType)
				{
					filters.pop();
				}
			}
		} catch (e:ReferenceError)
		{
			throw e;
		} 
		catch (e:Error)
		{
			
		}
		finally 
		{
			return filters;
		}
	}
	
	/**
	* Adds the specified filter to the filters applied to the specified displayObject. 
	* The filter is added at the end of the filter array, so it is applied after all others filters.
	* This operation is not performed if the specified filter will be a duplicate.
	* 
	* @param filter the filter to add.
	* @param displayObject the DisplayObject that may receive the specified filter.
	*/
	public static function push(filter:BitmapFilter, displayObject:DisplayObject):void
	{
		var filters:Array = removeDuplicates(filter,displayObject);
		filters.push(filter);
		displayObject.filters = filters;
	}
	
	/**
	* Adds the specified filter to the filters applied to the specified displayObject.
	* The filter is added at the beginning of the filter array, so it is applied after all others filters.
	* This operation is not performed if the specified filter will be a duplicate.
	* 
	* @param filter the filter to add.
	* @param displayObject the DisplayObject that may receive the specified filter.
	*/
	public static function unshift(filter:BitmapFilter, displayObject:DisplayObject):void
	{
		var filters:Array = removeDuplicates(filter,displayObject);
		filters.unshift(filter);
		displayObject.filters = filters;
	}
	
}

}