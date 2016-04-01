import swsfml_graphics
let window = swRenderWindow(title:"Test",width:800,height:800)
let music: Music?
var circle = CircleShape(radius:30,points:3)
circle.fillColor = sfColor.greenColor()
do {
    music = try Music(path:"../0477.ogg")
    music!.setLoop(false)
    music!.setVolume(0.3)
    music!.play()
  }
  catch _ {
    print("music is not loaded")
  }


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
