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

import swsfml_audio

enum MusicError : ErrorProtocol {
  case FileNotExist
}

public class Music : SoundStream{

  public var music : OpaquePointer
  public var soundStream: OpaquePointer = nil

  public init(path: String) throws{
    music = sfMusic_createFromFile(path)
    guard music != nil else{throw MusicError.FileNotExist}
  }

  public func play() {
    sfMusic_play(music)
  }

  public func pause() {
    sfMusic_pause(music)
  }

  public func stop() {
    sfMusic_stop(music)
  }

  public var channel: Int {
    get {
      return Int(sfMusic_getChannelCount(music))
    }
  }
  public var sampleRate: Int {
    get {
      return Int(sfMusic_getSampleRate(music))
    }
  }
  public var pitch: Float {
    set {
      sfMusic_setPitch(music, newValue)
    }
    get {
      return Float(sfMusic_getPitch(music))
    }
  }

  public var volume: Float {
    set {
      sfMusic_setVolume(music, newValue)
    }
    get {
      return Float(sfMusic_getVolume(music))
    }
  }

  public var relativeToListener: Bool {
    set {
      if (newValue == true) {
        sfMusic_setRelativeToListener(music, sfTrue)
      } else {
        sfMusic_setRelativeToListener(music, sfFalse)
      }
    }
    get {
      if (sfMusic_isRelativeToListener(music) == sfTrue) {
        return true
      } else {
        return false
      }
    }
  }

  public var loop: Bool {
    set {
      if (newValue == true) {
        sfMusic_setLoop(music, sfTrue)
      } else {
        sfMusic_setLoop(music, sfFalse)
      }
    }
    get {
      if (sfMusic_getLoop(music) == sfTrue) {
        return true
      } else {
        return false
      }
    }
  }

  public var status: sfSoundStatus {
    get {
      return sfMusic_getStatus(music)
    }
  }

  deinit {
    sfMusic_destroy(music)
  }

}
