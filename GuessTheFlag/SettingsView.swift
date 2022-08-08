//
//  SettingsView.swift
//  GuessTheFlag
//
//  Created by Luis Moncada on 06.08.22.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settingsAndState: SettingsAndState
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle.bold())
            Form {
                Section {
                    Toggle("Allow Deduction of Points", isOn: $settingsAndState.gameSettings.canLoosePoints)
                } footer: {
                    Text("If this setting is enabled, points will be deducted from the player if he clicks a wrong flag.")
                }
                
                Section {
                    Toggle("Allow Negative Score", isOn: $settingsAndState.gameSettings.negativeScoreIsAllowed)
                        .onReceive(settingsAndState.gameSettings.$negativeScoreIsAllowed) { isAllowed in
                            if !isAllowed && settingsAndState.gameState.score < 0 {
                                settingsAndState.gameState.score = 0
                            }
                        }
                } footer: {
                    Text("If this setting is enabled, the score can also take a negative value if more false flags were selected than correct ones.")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView(settingsAndState: SettingsAndState())
    }
}
