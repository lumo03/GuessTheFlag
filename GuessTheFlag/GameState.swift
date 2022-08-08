//
//  GameState.swift
//  GuessTheFlag
//
//  Created by Luis Moncada on 08.08.22.
//

import Foundation

class GameState: ObservableObject {
    @Published var score = 0
    @Published var counter = 0
}
