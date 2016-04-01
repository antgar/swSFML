// COPYRIGHT (c) 2016 Nicolas Charvoz
//
// MIT License
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation
import swsfml_audio

public protocol SoundStream: SoundSource{
  func play()
  func pause()
  func stop()
  var soundStream: OpaquePointer {get}
  var channel: Int {get}
  var sampleRate: Int {get}
  var status: sfSoundStatus {get}
  // public var playingOffset: Time {get set}
  var loop: Bool {get set}
  var pitch: Float {get set}
  var volume: Float{get set}
  var relativeToListener: Bool {get set}
  var minDistance: Float {get set}
  var attenuation: Float {get set}
}

extension SoundStream {
  func play() {
    sfSoundStream_play(soundStream)
  }
  func pause() {
    sfSoundStream_pause(soundStream)
  }
  func stop() {
    sfSoundStream_stop(soundStream)
  }
  public var channel: Int {
    get{
      return Int(sfSoundStream_getChannelCount(soundStream))
    }
  }
  public var sampleRate: Int {
    get {
      return Int(sfSoundStream_getSampleRate(soundStream))
    }
  }
  public var status: sfSoundStatus {
    get {
      return sfSoundStream_getStatus(soundStream)
    }
  }
  public var loop: Bool {
    get {
      if (sfSoundStream_getLoop(soundStream) == sfTrue) {
        return true
      } else {
        return false
      }
    }
    set {
      if (newValue == true) {
        sfSoundStream_setLoop(soundStream, sfTrue)
      } else {
        sfSoundStream_setLoop(soundStream, sfFalse)
      }
    }
  }
  public var pitch: Float {
    get {
      return Float(sfSoundStream_getPitch(soundStream))
    }
    set {
      sfSoundStream_setPitch(soundStream, newValue)
    }
  }
  public var volume: Float {
    get {
      return Float(sfSoundStream_getVolume(soundStream))
    }
    set {
      sfSoundStream_setVolume(soundStream, newValue)
    }
  }
  public var relativeToListener: Bool {
    get {
      if (sfSoundStream_isRelativeToListener(soundStream) == sfTrue) {
        return true
      } else {
        return false
      }
    }
    set {
      if (newValue == true) {
        sfSoundStream_setRelativeToListener(soundStream, sfTrue)
      } else {
        sfSoundStream_setRelativeToListener(soundStream, sfFalse)
      }
    }
  }
  public var minDistance: Float {
    get {
      return Float(sfSoundStream_getMinDistance(soundStream))
    }
    set {
      sfSoundStream_setMinDistance(soundStream, newValue)
    }
  }
  public var attenuation: Float {
    get {
      return Float(sfSoundStream_getAttenuation(soundStream))
    }
    set {
      sfSoundStream_setAttenuation(soundStream, newValue)
    }
  }
}
