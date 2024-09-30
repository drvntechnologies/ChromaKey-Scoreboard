//
//  ScoreBoardDisplayView.swift
//  ChromaKey Scoreboard
//
//  Created by Cameron Tarbell on 9/30/24.
//

import SwiftUI

struct ScoreboardDisplayView: View {
    @ObservedObject var viewModel: ScoreboardViewModel

    var body: some View {
        ZStack(alignment: .top) {
            HStack {
                // Team A Display
                VStack {
                    Text(viewModel.teamA.name)
                        .font(.title)
                        .foregroundColor(.white)
                    Text("\(viewModel.teamA.score)")
                        .font(.system(size: 48))
                        .foregroundColor(.white)
                }
                Spacer()
                // Timer Display
                Text(timeString(time: viewModel.timeInSeconds))
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                Spacer()
                // Team B Display
                VStack {
                    Text(viewModel.teamB.name)
                        .font(.title)
                        .foregroundColor(.white)
                    Text("\(viewModel.teamB.score)")
                        .font(.system(size: 48))
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Color.green.opacity(0.8)) // Slightly transparent for better visibility
            
            // Draggable Area at the Top
            DraggableView()
                .frame(height: 30) // Height of the draggable area
                .background(Color.clear) // Transparent background
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear) // Ensure the window's background is clear
    }

    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    struct ScoreboardDisplayView_Previews: PreviewProvider {
        static var previews: some View {
            ScoreboardDisplayView(viewModel: ScoreboardViewModel())
        }
    }
    
}
