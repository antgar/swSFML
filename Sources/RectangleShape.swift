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
public class RectangleShape : ShapeProtocol{
  public private(set) var shape: OpaquePointer
  public var position : (Float,Float) {
    get{
      let vector = sfRectangleShape_getPosition(shape)
      return (vector.x,vector.y)
    }
    set{
      let vector = sfVector2f(x:newValue.0,y:newValue.1)
      sfRectangleShape_setPosition(shape,vector)
    }
  }
  public var rotation : Float{
    get{
      return sfRectangleShape_getRotation(shape)
    }set{
      sfRectangleShape_setRotation(shape,newValue)
    }
  }
  public var scale :(Float,Float){
    get{
      let vector = sfRectangleShape_getPosition(shape)
      return (vector.x,vector.y)
    }set{
      let vector = sfVector2f(x:newValue.0,y:newValue.1)
      sfRectangleShape_setScale(shape,vector)
    }
  }
  public var origin : (Float,Float){
    get{
      let vector = sfRectangleShape_getPosition(shape)
      return (vector.x,vector.y)
    }set{
      let vector = sfVector2f(x:newValue.0,y:newValue.1)
      sfRectangleShape_setOrigin(shape,vector)
    }
  }
  public var fillColor : sfColor{
    get{
      return sfRectangleShape_getFillColor(shape)
    }set{
      sfRectangleShape_setFillColor(shape,newValue)
    }
  }
  public var outlineColor : sfColor{
    get{
      return sfRectangleShape_getOutlineColor(shape)
    }set{
      sfRectangleShape_setOutlineColor(shape,newValue)
    }
  }
  public var outlineThickness : Float{
    get{
      return sfRectangleShape_getOutlineThickness(shape)
    }
    set{
      sfRectangleShape_setOutlineThickness(shape,newValue)
    }
  }
   init(width:Float,height:Float){
     let vector = sfVector2f(x:width,y:height)
     shape = sfRectangleShape_create()
     sfRectangleShape_setSize(shape,vector)
  }

  //MARK: ShapeProtocol
  public func getPointCount()->Int{
    return Int(sfRectangleShape_getPointCount(shape))
  }
  public func getPoint(index:Int)->(Float,Float){
      let vector = sfRectangleShape_getPoint(shape,index)
      return (vector.x,vector.y)
  }
  public func move(offsetX:Float,offsetY:Float){
    let vector = sfVector2f(x:offsetX,y:offsetY)
    sfRectangleShape_move(shape,vector)
  }
  public func rotate(angle:Float){
    sfRectangleShape_rotate(shape,angle)
  }
  public func scale(factorX:Float,factorY:Float){
    let vector = sfVector2f(x:factorX,y:factorY)
    sfRectangleShape_scale(shape,vector)
  }
  public func draw(target:RenderTarget){}
}
