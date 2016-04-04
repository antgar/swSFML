import swsfml_graphics
public class customShape:ShapeProtocol{
  public private(set) var shape: OpaquePointer

  init(){
    //shape = create()
    shape = sfCircleShape_create()
    print("CREATE CUSTOM")
    //create()
  }
  public func getPointCount()->Int{
    return 30
  }

  public func getPoint(index:Int)->(Float,Float){
    return(1,1)
  }
  public func draw(target:RenderTarget){}
}
