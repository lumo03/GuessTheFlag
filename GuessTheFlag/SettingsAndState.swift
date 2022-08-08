//
//  SettingsAndState.swift
//  GuessTheFlag
//
//  Created by Luis Moncada on 08.08.22.
//

import Foundation
import SwiftUI

class SettingsAndState: ObservableObject {
    
    // customizable constant
    let rounds = 8
    
    @ObservedObject var gameState = GameState()
    @ObservedObject var gameSettings = GameSettings()
    
    func didWin() {
        gameState.counter += 1
        gameState.score += 1
    }
    
    func didLoose() {
        gameState.counter += 1
        if gameSettings.canLoosePoints {
            if gameState.score > 0 {
                gameState.score -= 1
            } else if gameSettings.negativeScoreIsAllowed {
                gameState.score -= 1
            }
        }
    }
    
    func reset() {
        gameState.score = 0
        gameState.counter = 0
    }
    
    func isGameOver() -> Bool {
        gameState.counter >= rounds
    }
}
