//
//  Functions.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/30/25.
//

import Foundation
import AVKit

private var audioPlayer: AVAudioPlayer?

func playAudio(fileName: String, fileType: String) {
    let sound = Bundle.main.path(forResource: fileName, ofType: fileType)
    audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
    audioPlayer?.numberOfLoops = -1 // Loop Forever
    audioPlayer?.play()
}
