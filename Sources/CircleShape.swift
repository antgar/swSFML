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

import Foundation
import swsfml_graphics

public class CircleShape:ShapeProtocol{
  private(set) var circleShape: OpaquePointer
  public var position : (Float,Float) {
    get{
      let vector = sfCircleShape_getPosition(circleShape)
      return (vector.x,vector.y)
    }
    set{
      let vector = sfVector2f(x:newValue.0,y:newValue.1)
      sfCircleShape_setPosition(circleShape,vector)
    }
  }
  public var rotation : Float{
    get{
      return sfCircleShape_getRotation(circleShape)
    }set{
      sfCircleShape_setRotation(circleShape,newValue)
    }
  }
  public var scale :(Float,Float){
    get{
      let vector = sfCircleShape_getPosition(circleShape)
      return (vector.x,vector.y)
    }set{
      let vector = sfVector2f(x:newValue.0,y:newValue.1)
      sfCircleShape_setScale(circleShape,vector)
    }
  }
  public var origin : (Float,Float){
    get{
      let vector = sfCircleShape_getPosition(circleShape)
      return (vector.x,vector.y)
    }set{
      let vector = sfVector2f(x:newValue.0,y:newValue.1)
      sfCircleShape_setOrigin(circleShape,vector)
    }
  }
  public var fillColor : sfColor{
    get{
      return sfCircleShape_getFillColor(circleShape)
    }set{
      sfCircleShape_setFillColor(circleShape,newValue)
    }
  }
  public var outlineColor : sfColor{
    get{
      return sfCircleShape_getOutlineColor(circleShape)
    }set{
      sfCircleShape_setOutlineColor(circleShape,newValue)
    }
  }
   init(radius:Float){
     circleShape = sfCircleShape_create()
     sfCircleShape_setRadius(circleShape,radius)
  }

  //MARK: ShapeProtocol
  public func getPointCount()->Int{
    return Int(sfCircleShape_getPointCount(circleShape))
  }

  public subscript(index:Int)->(Float,Float){
    get{
      let vector = sfCircleShape_getPoint(circleShape,index)
      return (vector.x,vector.y)
    }
  }
  public func move(offsetX:Float,offsetY:Float){
    let vector = sfVector2f(x:offsetX,y:offsetY)
    sfCircleShape_move(circleShape,vector)
  }
  public func rotate(angle:Float){
    sfCircleShape_rotate(circleShape,angle)
  }
  public func scale(factorX:Float,factorY:Float){
    let vector = sfVector2f(x:factorX,y:factorY)
    sfCircleShape_scale(circleShape,vector)
  }
}
