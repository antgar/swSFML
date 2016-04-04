import swsfml_graphics
import Foundation
//SIMPLE PONG GAME TO TEST SWFML
let pi = 3.14159
let width = 800
let height = 600
let ballRadius:Float = 10.0
let ballSpeed = 300.0
var ballAngle = 0.0
let paddleSize : (Float,Float) = (25.0,100.0)
let paddleSpeed:Float = 400.0
var isPlaying = false
let clock = Clock()
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

let font = try! Font(file:"sansation.ttf")
let pauseMessage = Text(string:"Welcome to swFML Pong\n Press space to start the game",font:font)
pauseMessage.position = (170.0, 150.0)
pauseMessage.color = sfColor.whiteColor()
pauseMessage.characterSize = 30
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
        clock.restart()
        leftPaddle.position = (10 + paddleSize.0 / 2, Float(height / 2))
        rightPaddle.position = (Float(width) - 10 - paddleSize.0 / 2,Float(height/2))
        ball.position = (Float(width) / 2, Float(height) / 2)
      }
    }
  }
  if isPlaying {
    let deltaTime = clock.restart().seconds
    //move the player Paddle
    if Keyboard.isKeyPressed(sfKeyUp){
      leftPaddle.move(0,offsetY:-paddleSpeed * deltaTime)
    }
    else if Keyboard.isKeyPressed(sfKeyDown){
      leftPaddle.move(0,offsetY:paddleSpeed * deltaTime)
    }
    //move the ball
    let factor = Float(ballSpeed) * Float(deltaTime)
    ball.move(Float(cos(ballAngle)) * factor, offsetY:Float(sin(ballAngle)) * factor)
    //check Collisions
    if ball.position.0 - ballRadius < 0{
      isPlaying = false
      pauseMessage.string = "You lost !"
    }
    if ball.position.0 - ballRadius > Float(width){
      isPlaying = false
      pauseMessage.string = "You win !"
    }
  }
  window.clear(sfColor(r:50,g:200,b:50))
  if isPlaying{
    window.draw(leftPaddle)
    window.draw(rightPaddle)
    window.draw(ball)
  }
  else{
    window.draw(pauseMessage)
  }
  window.display()
}
