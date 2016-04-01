import swsfml_graphics

let window = swRenderWindow(title:"Test",width:800,height:800)
var circle = CircleShape(radius:30,points:3)
circle.fillColor = sfColor.greenColor()

// let music: Music?
//
// do {
//   music = try Music(path:"0564.ogg")
//   music!.play()
// } catch _ {
//   print ("Error")
// }


// let buffer: SoundBuffer?
// let sound: Sound?
//
// do {
//   buffer = try SoundBuffer(path: "0564.ogg")
//   sound = Sound()
//
//   sound!.buffer = buffer!
//   sound!.play()
//
// } catch _ { print("error")}

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
