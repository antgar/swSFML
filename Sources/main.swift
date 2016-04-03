import swsfml_graphics

//SIMPLE PONG GAME TO TEST SWFML
let pi = 3.14159
let width = 800
let height = 600
let ballRadius:Float = 10.0
let paddleSize : (Float,Float) = (25.0,100.0)
var isPlaying = false

let window = swRenderWindow(title:"Test",width:width,height:height)

let leftPaddle = RectangleShape(width:paddleSize.0 - 3,height:paddleSize.1 - 3)
leftPaddle.fillColor = sfColor(r:100,g:100,b:100)
leftPaddle.outlineThickness = 3
leftPaddle.outlineColor = sfColor.blackColor()
leftPaddle.origin = (paddleSize.0 / 2, paddleSize.1 / 2)

let rightPaddle = RectangleShape(width:paddleSize.0 - 3,height:paddleSize.1 - 3)
rightPaddle.outlineThickness = 3
rightPaddle.outlineColor = sfColor.blackColor()
rightPaddle.origin = (paddleSize.0 / 2,paddleSize.1 / 2)

let ball = CircleShape(radius:ballRadius - 3)
ball.outlineThickness = 3
ball.outlineColor = sfColor.blackColor()
ball.fillColor = sfColor(r:200,g:100,b:100)
ball.origin = (ballRadius / 2, ballRadius / 2)
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
    else{
      if key.isKeySpace && !isPlaying{
        isPlaying = true
        leftPaddle.position = (10 + paddleSize.0 / 2, Float(height / 2))
        rightPaddle.position = (Float(width) - 10 - paddleSize.0 / 2,Float(height/2))
        ball.position = (Float(width) / 2, Float(height) / 2)
      }
    }
  }
  window.clear(sfColor(r:50,g:200,b:50))
  if isPlaying{
    window.draw(leftPaddle)
    window.draw(rightPaddle)
    window.draw(ball)
  }
  window.display()
}
