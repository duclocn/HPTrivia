//
//  Functions.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/30/25.
//

import Foundation
import AVKit

var audioPlayer: AVAudioPlayer!
var playMusic: AVAudioPlayer!
var sfxPlayer: AVAudioPlayer!

func playAudio(fileName: String, fileType: String) {
    let sound = Bundle.main.path(forResource: fileName, ofType: fileType)
    audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
    audioPlayer.numberOfLoops = -1 // Loop Forever
    audioPlayer.play()
}

func playAMusic() {
    let songs = ["deep-in-the-dell", "let-the-mystery-unfold", "spellcraft", "hiding-place-in-the-forest"]
    
    let song = songs.randomElement()!
    
    let sound = Bundle.main.path(forResource: song, ofType: "mp3")
    playMusic = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
    playMusic.numberOfLoops = -1 // Loop Forever
    playMusic.volume = 0.1
    playMusic.play()
}

func sfxAudio(fileName: String) {
    let sound = Bundle.main.path(forResource: fileName, ofType: "mp3")
    sfxPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
    sfxPlayer.play()
}
