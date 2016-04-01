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
import Foundation

public struct TextStyle: OptionSet{
  public let rawValue : UInt32
  public init(rawValue: UInt32) { self.rawValue = rawValue }

  static let Regular = TextStyle(rawValue:0)
  static let Bold = TextStyle(rawValue:1 << 0)
  static let Italic = TextStyle(rawValue: 1 << 1)
  static let Underlined = TextStyle(rawValue: 1 << 2)
  static let StrikeThrough = TextStyle(rawValue:1 << 3)
}

public class Text:Transformable,Drawable{
  private(set) var text : OpaquePointer
  public var position :(Float,Float){
    get{
      let vector = sfText_getPosition(text)
      return (vector.x,vector.y)
    }set{
        let vector = sfVector2f(x:newValue.0,y:newValue.1)
        sfText_setPosition(text,vector)
    }
  }
  public var rotation : Float{
    get{
      return sfText_getRotation(text)
    }set{
      sfText_setRotation(text,newValue)
    }
  }
  public var scale :(Float,Float){
    get{
      let vector = sfText_getScale(text)
      return (vector.x,vector.y)
    }set{
      let vector = sfVector2f(x:newValue.0,y:newValue.1)
      sfText_setScale(text,vector)
    }
  }
  public var origin : (Float,Float){
    get{
      let vector = sfText_getOrigin(text)
      return (vector.x, vector.y)
    }set{
      let vector = sfVector2f(x:newValue.0,y:newValue.1)
      sfText_setOrigin(text,vector)
    }
  }
  public var color:sfColor{
    get{
      return sfText_getColor(text)
    }set{
      sfText_setColor(text,newValue)
    }
  }
  public var style:TextStyle{
    get{
      return TextStyle(rawValue:sfText_getStyle(text))
    }set{
      sfText_setStyle(text,newValue.rawValue)
    }
  }
  init(string:String,font:Font){
    text = sfText_create()
    sfText_setFont(text,font.font)
    sfText_setString(text,string)
    //sfText_setColor(text,sfColor.redColor())
  }
  public func move(offsetX:Float,offsetY:Float){
    let vector = sfVector2f(x:offsetX,y:offsetY)
    sfText_move(text,vector)
  }
  public func rotate(angle:Float){
    sfText_rotate(text,angle)
  }
  public func scale(factorX:Float,factorY:Float){
      let vector = sfVector2f(x:factorX,y:factorY)
      sfText_scale(text,vector)
  }
}
