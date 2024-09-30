//
//  ControlButtons.swift
//  ChromaKey Scoreboard
//
//  Created by Cameron Tarbell on 9/30/24.
//

import SwiftUI

struct ControlButtons: View {
    @ObservedObject var viewModel: ScoreboardViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                viewModel.startTimer()
            }) {
                Text("Start")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Button(action: {
                viewModel.stopTimer()
            }) {
                Text("Stop")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Button(action: {
                viewModel.resetTimer()
            }) {
                Text("Reset")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}

struct ControlButtons_Previews: PreviewProvider {
    @StateObject static var viewModel = ScoreboardViewModel()
    
    static var previews: some View {
        ControlButtons(viewModel: viewModel)
    }
}
