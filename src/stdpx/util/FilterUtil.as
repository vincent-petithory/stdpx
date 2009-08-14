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
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	public final class FilterUtil 
	{
		
		/**
		* Removes duplicate filter types in the filters array of a display object.
		* Filters that extends ShaderFilter are not processed 
		* (since Flash Player does not keep the real type of a filter that extends ShaderFilter)
		*/
		public static function removeDuplicates(filter:BitmapFilter, displayObject:DisplayObject):Array
		{
			var removedSome:Boolean = false;
			var filters:Array = displayObject.filters;
			try 
			{
				var FilterType:Class = getDefinitionByName(getQualifiedClassName(filter)) as Class;
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
		
		public static function push(filter:BitmapFilter, displayObject:DisplayObject):void
		{
			var filters:Array = removeDuplicates(filter,displayObject);
			filters.push(filter);
			displayObject.filters = filters;
		}
		
		public static function unshift(filter:BitmapFilter, displayObject:DisplayObject):void
		{
			var filters:Array = displayObject.filters;
			try 
			{
				var FilterType:Class = getDefinitionByName(getQualifiedClassName(filter)) as Class;
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
				
			} catch (e:Error)
			{
				
			}
			finally
			{
				filters.push(filter);
				displayObject.filters = filters;
			}
		}
		
	}

}