import Foundation
import swsfml_graphics
import swsfml_system
import swsfml_window

public struct VideoStyle: OptionSet{
  public let rawValue : UInt
  public init(rawValue: UInt) { self.rawValue = rawValue }

  static let None = VideoStyle(rawValue:0)
  static let Titlebar = VideoStyle(rawValue:1)
  static let Resize = VideoStyle(rawValue: 2)
  static let Close = VideoStyle(rawValue: 4)
  static let FullScreen = VideoStyle(rawValue:8)
  static let Default = [Titlebar,Resize,Close]
}

public class Window{
    private(set) var width : Int
    private(set) var height : Int
    private(set) var bitsPerPixel : Int
    private(set) var title : String
    private var window : OpaquePointer

    public init(title:String,width:Int,height:Int,bitsPerPixel:Int!=32,style:[VideoStyle]=VideoStyle.Default){
      self.title = title
      self.width = width
      self.height = height
      self.bitsPerPixel = bitsPerPixel
      let mode = sfVideoMode(width:UInt32(width),height:UInt32(height),bitsPerPixel:UInt32(bitsPerPixel))
      window = sfRenderWindow_create(mode, title,1 << 4,nil)
    }

    public convenience init(title:String,width:Int,height:Int,style:[VideoStyle]){
      self.init(title:title,width:width,height:height,bitsPerPixel:32,style:VideoStyle.Default)
    }
    public func isOpen()->Bool{
      return Bool(NSNumber(int:sfRenderWindow_isOpen(window)))
    }
}
