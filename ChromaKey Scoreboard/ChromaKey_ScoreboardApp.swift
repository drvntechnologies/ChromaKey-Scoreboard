//
//  ChromaKey_ScoreboardApp.swift
//  ChromaKey Scoreboard
//
//  Created by Cameron Tarbell on 9/30/24.
//

import SwiftUI

@main
struct ChromaKeyScoreboardApp: App {
    // Remove the viewModel from here to prevent duplicate instances
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        // No main window; all windows are managed by AppDelegate
        Settings {
            EmptyView()
        }
    }
}
