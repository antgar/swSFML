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

public class swColor{
  private(set) var red : Int
  private(set) var green : Int
  private(set) var  blue : Int
  private(set) var  alpha : Int

  public init(red:Int,green:Int,blue:Int,alpha:Int){
      self.red = red
      self.green = green
      self.blue = blue
      self.alpha = alpha
  }

  public static func blackColor()->swColor{
    return swColor(red:0,green:0,blue:0,alpha:255)
  }

  public static func redColor()->swColor{
    return swColor(red:1,green:0,blue:0,alpha:255)
  }

  public static func blueColor()->swColor{
    return swColor(red:0,green:0,blue:1,alpha:255)
  }

  public static func greenColor()->swColor{
    return swColor(red:0,green:1,blue:0,alpha:255)
  }
  
}
