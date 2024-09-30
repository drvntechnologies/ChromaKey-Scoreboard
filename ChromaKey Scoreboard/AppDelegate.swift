//
//  AppDelegate.swift
//  ChromaKey Scoreboard
//
//  Created by Cameron Tarbell on 9/30/24.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var controlWindow: NSWindow!
    var displayWindow: NSWindow!
    
    // Create a single shared instance of ScoreboardViewModel
    let viewModel = ScoreboardViewModel()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create Control Window
        let controlView = ControlView(viewModel: viewModel)
        controlWindow = NSWindow(
            contentRect: NSRect(x: 100, y: 100, width: 400, height: 600),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered, defer: false)
        controlWindow.title = "Control Panel"
        controlWindow.contentView = NSHostingView(rootView: controlView)
        controlWindow.makeKeyAndOrderFront(nil)
        
        // Create Display Window
        let displayView = ScoreboardDisplayView(viewModel: viewModel)
        displayWindow = NSWindow(
            contentRect: NSRect(x: 550, y: 100, width: 800, height: 200),
            styleMask: [.borderless],
            backing: .buffered, defer: false)
        displayWindow.title = "Scoreboard Display"
        displayWindow.isOpaque = false
        displayWindow.backgroundColor = NSColor.green
        displayWindow.hasShadow = false
        displayWindow.level = .floating
        displayWindow.contentView = NSHostingView(rootView: displayView)
        displayWindow.makeKeyAndOrderFront(nil)
    }
}
