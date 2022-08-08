//
//  GameSettings.swift
//  GuessTheFlag
//
//  Created by Luis Moncada on 08.08.22.
//

import Foundation

class GameSettings: ObservableObject {
    @Published var negativeScoreIsAllowed = false
    @Published var canLoosePoints = false
}
