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

public extension sfEvent{
  public var isClosed : Bool {
    return type == sfEvtClosed
  }

  public var isKeyPressed:Bool{
    return type == sfEvtKeyPressed
  }

  public var isLostFocus : Bool {
    return type == sfEvtLostFocus
  }

  public var isGainedFocus : Bool {
    return type == sfEvtGainedFocus
  }

  public var isKeyUp : Bool {
    return isKeyPressed && key.code == sfKeyUp
  }

  public var isKeyDown : Bool {
    return isKeyPressed && key.code == sfKeyDown
  }

  public var isKeyRight : Bool {
    return isKeyPressed && key.code == sfKeyRight
  }

  public var isKeyLeft : Bool {
    return isKeyPressed && key.code == sfKeyLeft
  }

  public var isMouseButtonPressed : Bool {
    return type == sfEvtMouseButtonPressed
  }

  public var isMouseRightButtonPressed : Bool {
    return isMouseButtonPressed && mouseButton.button == sfMouseRight
  }

  public var isMouseLeftButtonPressed : Bool {
    return isMouseButtonPressed && mouseButton.button == sfMouseLeft
  }

  public var isMouseMiddleButton : Bool {
    return isMouseButtonPressed && mouseButton.button == sfMouseMiddle
  }
}
