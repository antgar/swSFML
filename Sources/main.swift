let window = Window(title:"Test",width:200,height:200)
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
