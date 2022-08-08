//
//  GuessTheFlagApp.swift
//  GuessTheFlag
//
//  Created by Luis Moncada on 05.08.22.
//

import SwiftUI

@main
struct GuessTheFlagApp: App {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var settingsAndState = SettingsAndState()
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "TabBarUnselected")
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView(settingsAndState: settingsAndState)
                    .tabItem {
                        Label("Game", systemImage: "gear")
                    }
                
                SettingsView(settingsAndState: settingsAndState)
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

