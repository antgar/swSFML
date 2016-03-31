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
import swsfml_system
import swsfml_window

public struct Point{
  var position :(Float,Float)
  var normal : (Float,Float)
  var color : sfColor
  var outlineColor : sfColor
}

public protocol ShapeProtocol:Transformable,Drawable{
  var shape : OpaquePointer {get}
  var fillColor : sfColor {get set}
  var outlineColor : sfColor {get set}
  var outlineThickness : Float {get set}
  func getPointCount()->Int
  func getPoint(index:Int)->(Float,Float)
}

extension ShapeProtocol{
  func update(){ //Never Override this function !
    sfShape_update(shape)
  }
  public var position : (Float,Float) {
    get{
      let vector = sfShape_getPosition(shape)
      return (vector.x,vector.y)
    }
    set{
      let vector = sfVector2f(x:newValue.0,y:newValue.1)
      sfShape_setPosition(shape,vector)
    }
  }
  public var rotation : Float{
    get{
      return sfShape_getRotation(shape)
    }set{
      sfShape_setRotation(shape,newValue)
    }
  }
  public var scale :(Float,Float){
    get{
      let vector = sfShape_getPosition(shape)
      return (vector.x,vector.y)
    }set{
      let vector = sfVector2f(x:newValue.0,y:newValue.1)
      sfShape_setScale(shape,vector)
    }
  }
  public var origin : (Float,Float){
    get{
      let vector = sfShape_getPosition(shape)
      return (vector.x,vector.y)
    }set{
      let vector = sfVector2f(x:newValue.0,y:newValue.1)
      sfShape_setOrigin(shape,vector)
    }
  }
  public var fillColor : sfColor{
    get{
      return sfShape_getFillColor(shape)
    }set{
      sfShape_setFillColor(shape,newValue)
    }
  }
  public var outlineColor : sfColor{
    get{
      return sfShape_getOutlineColor(shape)
    }set{
      sfShape_setOutlineColor(shape,newValue)
    }
  }
  public var outlineThickness : Float{
    get{
      return sfShape_getOutlineThickness(shape)
    }
    set{
      sfShape_setOutlineThickness(shape,newValue)
    }
  }
  public func move(offsetX:Float,offsetY:Float){
    let vector = sfVector2f(x:offsetX,y:offsetY)
    sfCircleShape_move(shape,vector)
  }
  public func rotate(angle:Float){
    sfCircleShape_rotate(shape,angle)
  }
  public func scale(factorX:Float,factorY:Float){
    let vector = sfVector2f(x:factorX,y:factorY)
    sfCircleShape_scale(shape,vector)
  }
}
