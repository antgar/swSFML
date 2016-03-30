let window = Window(title:"Test",width:200,height:200)
let texture = try! Texture(path:"coucou.png")
let music = try! Music(path:"~/Téléchargements/0933.ogg")
music.play()

while window.isOpen(){
  window.keyPressed(){key in
    if key.isClosed{
      window.close()
    }
    else if key.isKeyUp{
      print("KEY UP")
    }
    window.clear()
    window.display()
  }
}
