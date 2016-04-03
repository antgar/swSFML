// COPYRIGHT (c) 2016 Antoine Garcia
//
// MIT License
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import swsfml_graphics

public extension sfColor{
  public static func blackColor()->sfColor{
    return sfBlack
  }
  public static func whiteColor()->sfColor{
    return sfWhite
  }
  public static func greenColor()->sfColor{
    return sfGreen
  }
  public static func redColor()->sfColor{
    return sfRed
  }
  public static func blueColor()->sfColor{
    return sfBlue
  }
  public static func yellowColor()->sfColor{
    return sfBlue
  }
  public static func magentaColor()->sfColor{
    return sfMagenta
  }
  public static func cyanColor()->sfColor{
    return sfCyan
  }
  public static func transparentColor()->sfColor{
    return sfTransparent
  }
  public init(r:Int,g:Int,b:Int){
    self.r = UInt8(r)
    self.g = UInt8(g)
    self.b = UInt8(b)
    self.a = 255
  }
}
