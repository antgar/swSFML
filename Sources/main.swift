let window = Window(title:"Test",width:200,height:200)
while window.isOpen(){
  window.keyPressed(){event in
    window.close()
  }
}
