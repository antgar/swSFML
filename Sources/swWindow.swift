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

public class Window{
    private(set) var width : Int
    private(set) var height : Int
    private(set) var bitsPerPixel : Int
    private(set) var title : String
    private var window : OpaquePointer

    public init(title:String,width:Int,height:Int,bitsPerPixel:Int!=32,style:VideoStyle=VideoStyle.Default){
      self.title = title
      self.width = width
      self.height = height
      self.bitsPerPixel = bitsPerPixel
      let mode = sfVideoMode(width:UInt32(width),height:UInt32(height),bitsPerPixel:UInt32(bitsPerPixel))
      window = sfRenderWindow_create(mode, title,style.rawValue,nil)
    }

    public convenience init(title:String,width:Int,height:Int,style:[VideoStyle]){
      self.init(title:title,width:width,height:height,bitsPerPixel:32,style:VideoStyle.Default)
    }
    public func isOpen()->Bool{
      return Bool(NSNumber(int:sfRenderWindow_isOpen(window)))
    }
}
