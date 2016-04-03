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

import swsfml_system

public extension sfTime{
  var seconds : Float{
    get{
      return sfTime_asSeconds(self)
    }
  }
  var milliseconds : Int {
    return Int(sfTime_asMilliseconds(self))
  }

  var microseconds : Int {
    return Int(sfTime_asMicroseconds(self))
  }

  init(seconds:Float){
      self = sfSeconds(seconds)
  }
  init(milliseconds:Int){
    self = sfMilliseconds(Int32(milliseconds))
  }
  init(microseconds:Int){
    self = sfMicroseconds(Int64(microseconds))
  }
}
public class Clock{
  private var clock : OpaquePointer

   init(){
    clock = sfClock_create()
  }

  public func getElapsedTime()->sfTime{
    return sfClock_getElapsedTime(clock)
  }
  
  public func restart()->sfTime{
    return sfClock_restart(clock)
  }
  deinit{
    sfClock_destroy(clock)
  }
}
