// COPYRIGHT (c) 2016 <YOUR NAME>
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

import swsfml_audio

public class Sound : SoundSource {
  public var sound: OpaquePointer

  public init() {
    sound = sfSound_create()
  }

  func play() {
    sfSound_play(sound)
  }

  func pause() {
    sfSound_pause(sound)
  }
  func stop() {
    sfSound_stop(sound)
  }

  public var buffer : SoundBuffer {
    set {
      sfSound_setBuffer(sound, newValue.buffer)
    }
    get {
      let buffer = SoundBuffer(Buffer: sfSound_getBuffer(sound))
      return buffer
    }
  }

  public var loop: Bool {
    set {
      if (newValue == true) {
        sfSound_setLoop(sound, sfTrue)
      } else {
        sfSound_setLoop(sound, sfFalse)
      }
    }
    get {
      if (sfSound_getLoop(sound) == sfTrue) {
        return true
      } else {
        return false
      }
    }
  }

  public var status : sfSoundStatus {
    get {
      return sfSound_getStatus(sound)
    }
  }

  public var pitch: Float {
    get {
      return sfSound_getPitch(sound)
    }
    set {
      sfSound_setPitch(sound, newValue)
    }
  }

  public var volume: Float {
    get {
      return sfSound_getVolume(sound)
    }
    set {
      sfSound_setVolume(sound, newValue)
    }
  }

  public var relativeToListener: Bool {
    get{
      if (sfSound_isRelativeToListener(sound) == sfTrue) {
        return true
      } else {
        return false
      }
    }
    set{
      if (newValue == true) {
        sfSound_setRelativeToListener(sound, sfTrue)
      } else {
        sfSound_setRelativeToListener(sound, sfFalse)
      }

    }
  }
  public var minDistance: Float {
    get{
      return Float(sfSound_getMinDistance(sound))
    }
    set{
      sfSound_setMinDistance(sound, newValue)
    }
  }

  public var attenuation: Float {
    get{
      return Float(sfSound_getAttenuation(sound))
    }
    set{
      sfSound_setAttenuation(sound, newValue)
    }
  }

}
