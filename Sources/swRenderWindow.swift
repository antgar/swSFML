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

public struct VideoStyle: OptionSet{
  public let rawValue : UInt32
  public init(rawValue: UInt32) { self.rawValue = rawValue }

  static let None = VideoStyle(rawValue:0)
  static let Titlebar = VideoStyle(rawValue:1 << 0)
  static let Resize = VideoStyle(rawValue: 1 << 1)
  static let Close = VideoStyle(rawValue: 1 << 2)
  static let FullScreen = VideoStyle(rawValue:1 << 3)
  static let Default :VideoStyle = [Titlebar,Resize,Close]
}

public class swRenderWindow:RenderTargetProtocol{
    private(set) var width : Int
    private(set) var height : Int
    private(set) var bitsPerPixel : Int
    private(set) var title : String
    private var window : OpaquePointer

    public init(title:String,width:Int,height:Int,bitsPerPixel:Int,style:VideoStyle){
      self.title = title
      self.width = width
      self.height = height
      self.bitsPerPixel = bitsPerPixel
      let mode = sfVideoMode(width:UInt32(width),height:UInt32(height),bitsPerPixel:UInt32(bitsPerPixel))
      window = sfRenderWindow_create(mode, title,style.rawValue,nil)
    }

    public convenience init(title:String,width:Int,height:Int,style:VideoStyle){
        self.init(title:title,width:width,height:height,bitsPerPixel:32,style:style)
    }

    public convenience init(title:String,width:Int,height:Int){
      self.init(title:title,width:width,height:height,bitsPerPixel:32,style:.Default)
    }

    public func isOpen()->Bool{
      return Bool(NSNumber(int:sfRenderWindow_isOpen(window)))
  }

  public func close(){
    sfRenderWindow_close(window)
  }

  public func clear(color:swColor=swColor.blackColor()){
    let sfmlcolor = sfColor(r:UInt8(color.red),g:UInt8(color.green),b:UInt8(color.blue),a:UInt8(color.alpha))
    sfRenderWindow_clear(window,sfmlcolor)
  }

  public func display(){
    sfRenderWindow_display(window)
  }

   public func keyPressed(completionHandler:(event:sfEvent)->Void){
       var eventCatch : sfEvent = sfEvent()
       while(sfRenderWindow_pollEvent(window,&eventCatch) == 1){
          completionHandler(event:eventCatch)
       }
   }

   deinit{
     sfWindow_destroy(window)
   }
}
