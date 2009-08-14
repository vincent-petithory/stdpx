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

package stdpx.types 
{

	public class ChannelTransform 
	{
		
		/**
		* 		rOut 	gOut 	bOut 	aOut	
		* rIn	 0		1		2		3 
		* gIn	 4		5		6		7 
		* bIn	 8		9		10		11 
		* aIn	 12		13		14		15
		* 
		*/
		public var rawChannelData:Array;
		
		/**
		* 
		* Offsets : 
		*/
		public var rawOffsetData:Array;
		
		public function ChannelTransform(
				rr:Number = 1, rg:Number = 0, rb:Number = 0, ra:Number = 0, 
				gr:Number = 0, gg:Number = 1, gb:Number = 0, ga:Number = 0, 
				br:Number = 0, bg:Number = 0, bb:Number = 1, ba:Number = 0, 
				ar:Number = 0, ag:Number = 0, ab:Number = 0, aa:Number = 1, 
				or:Number = 0, og:Number = 0, ob:Number = 0, oa:Number = 0 
			)
		{
			super();
			this.rawChannelData = new Array(16);
			this.rawOffsetData = new Array(4);
			
			rawChannelData[0] = rr;
			rawChannelData[1] = rg;
			rawChannelData[2] = rb;
			rawChannelData[3] = ra;
			
			rawChannelData[4] = gr;
			rawChannelData[5] = gg;
			rawChannelData[6] = gb;
			rawChannelData[7] = ga;
			
			rawChannelData[8] = br;
			rawChannelData[9] = bg;
			rawChannelData[10] = bb;
			rawChannelData[11] = ba;
			
			rawChannelData[12] = ar;
			rawChannelData[13] = ag;
			rawChannelData[14] = ab;
			rawChannelData[15] = aa;
			
			rawOffsetData[0] = or;
			rawOffsetData[1] = og;
			rawOffsetData[2] = ob;
			rawOffsetData[3] = oa;
		}
		
		public function setRedTransform(red:Number = 1, green:Number = 0, blue:Number = 0, alpha:Number = 0):void
		{
			this.rawChannelData[0] = red;
			this.rawChannelData[4] = green;
			this.rawChannelData[8] = blue;
			this.rawChannelData[12] = alpha;
		}
		
		public function setGreenTransform(red:Number = 0, green:Number = 1, blue:Number = 0, alpha:Number = 0):void
		{
			this.rawChannelData[1] = red;
			this.rawChannelData[5] = green;
			this.rawChannelData[9] = blue;
			this.rawChannelData[13] = alpha;
		}
		
		public function setBlueTransform(red:Number = 0, green:Number = 0, blue:Number = 1, alpha:Number = 0):void
		{
			this.rawChannelData[2] = red;
			this.rawChannelData[6] = green;
			this.rawChannelData[10] = blue;
			this.rawChannelData[14] = alpha;
		}
		
		public function setAlphaTransform(red:Number = 0, green:Number = 0, blue:Number = 0, alpha:Number = 1):void
		{
			this.rawChannelData[3] = red;
			this.rawChannelData[7] = green;
			this.rawChannelData[11] = blue;
			this.rawChannelData[15] = alpha;
		}
		
		public function setOffsetTransform(red:Number = 0, green:Number = 0, blue:Number = 0, alpha:Number = 0):void
		{
			this.rawOffsetData[0] = red;
			this.rawOffsetData[1] = green;
			this.rawOffsetData[2] = blue;
			this.rawOffsetData[3] = alpha;
		}
		
		public function get redTransform():Array
		{
			return [rawChannelData[0],rawChannelData[4],rawChannelData[8],rawChannelData[12]];
		}
		
		public function get greenTransform():Array
		{
			return [rawChannelData[1],rawChannelData[5],rawChannelData[9],rawChannelData[13]];
		}
		
		public function get blueTransform():Array
		{
			return [rawChannelData[2],rawChannelData[6],rawChannelData[10],rawChannelData[14]];
		}
		
		public function get alphaTransform():Array
		{
			return [rawChannelData[3],rawChannelData[7],rawChannelData[11],rawChannelData[15]];
		}
		
		public function get offsetTransform():Array
		{
			return rawOffsetData.slice();
		}
		
		public function clone():ChannelTransform
		{
			var ct:ChannelTransform = new ChannelTransform();
			ct.rawChannelData = this.rawChannelData.slice();
			ct.rawOffsetData = this.rawOffsetData.slice();
			return ct;
		}
		
		public function toString():String
		{
			return "[Object ChannelTransform]";
		}
		
		public function set rr(value:Number):void
		{
			rawChannelData[0] = value;
		}
		
		public function set rg(value:Number):void
		{
			rawChannelData[4] = value;
		}
		
		public function set rb(value:Number):void
		{
			rawChannelData[8] = value;
		}
		
		public function set ra(value:Number):void
		{
			rawChannelData[12] = value;
		}
		
		
		public function set gr(value:Number):void
		{
			rawChannelData[1] = value;
		}
		
		public function set gg(value:Number):void
		{
			rawChannelData[5] = value;
		}
		
		public function set gb(value:Number):void
		{
			rawChannelData[9] = value;
		}
		
		public function set ga(value:Number):void
		{
			rawChannelData[13] = value;
		}
		
		
		public function set br(value:Number):void
		{
			rawChannelData[2] = value;
		}
		
		public function set bg(value:Number):void
		{
			rawChannelData[6] = value;
		}
		
		public function set bb(value:Number):void
		{
			rawChannelData[10] = value;
		}
		
		public function set ba(value:Number):void
		{
			rawChannelData[14] = value;
		}
		
		public function set ar(value:Number):void
		{
			rawChannelData[3] = value;
		}
		
		public function set ag(value:Number):void
		{
			rawChannelData[7] = value;
		}
		
		public function set ab(value:Number):void
		{
			rawChannelData[11] = value;
		}
		
		public function set aa(value:Number):void
		{
			rawChannelData[15] = value;
		}
		
		public function set or(value:Number):void
		{
			rawOffsetData[0] = value;
		}
		
		public function set og(value:Number):void
		{
			rawOffsetData[1] = value;
		}
		
		public function set ob(value:Number):void
		{
			rawOffsetData[2] = value;
		}
		
		public function set oa(value:Number):void
		{
			rawOffsetData[3] = value;
		}
		
		public function get rr():Number
		{
			return rawChannelData[0];
		}
		
		public function get rg():Number
		{
			return rawChannelData[4];
		}
		
		public function get rb():Number
		{
			return rawChannelData[8];
		}
		
		public function get ra():Number
		{
			return rawChannelData[12];
		}
		
		
		public function get gr():Number
		{
			return rawChannelData[1];
		}
		
		public function get gg():Number
		{
			return rawChannelData[5];
		}
		
		public function get gb():Number
		{
			return rawChannelData[9];
		}
		
		public function get ga():Number
		{
			return rawChannelData[13];
		}
		
		
		public function get br():Number
		{
			return rawChannelData[2];
		}
		
		public function get bg():Number
		{
			return rawChannelData[6];
		}
		
		public function get bb():Number
		{
			return rawChannelData[10];
		}
		
		public function get ba():Number
		{
			return rawChannelData[14];
		}
		
		public function get ar():Number
		{
			return rawChannelData[3];
		}
		
		public function get ag():Number
		{
			return rawChannelData[7];
		}
		
		public function get ab():Number
		{
			return rawChannelData[11];
		}
		
		public function get aa():Number
		{
			return rawChannelData[15];
		}
		
		public function get or():Number
		{
			return rawOffsetData[0];
		}
		
		public function get og():Number
		{
			return rawOffsetData[1];
		}
		
		public function get ob():Number
		{
			return rawOffsetData[2];
		}
		
		public function get oa():Number
		{
			return rawOffsetData[3];
		}
		
	}

}