import swsfml_graphics

let window = swRenderWindow(title:"Test",width:800,height:800)
var circle = CircleShape(radius:30,points:3)
circle.fillColor = sfColor.greenColor()



while window.isOpen(){
  window.keyPressed(){key in
    if key.isClosed{
      window.close()
    }
    else if key.isKeyUp{
      print("KEY UP")
    }
  }
  window.clear()
  window.draw(circle)
  window.display()
}
