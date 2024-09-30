//
//  ContentView.swift
//  ChromaKey Scoreboard
//
//  Created by Cameron Tarbell on 9/30/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ScoreboardViewModel()
    
    var body: some View {
        VStack {
            HStack {
                TeamView(team: $viewModel.teamA)
                Spacer()
                TeamView(team: $viewModel.teamB)
            }
            .padding()
            
            Divider()
                .padding()
            
            TimerView(timeInSeconds: $viewModel.timeInSeconds, isCountingDown: $viewModel.isCountingDown)
            
            ControlButtons(viewModel: viewModel)
                .padding()
        }
        .padding()
        .background(Color.green) // Chroma Key Background
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
