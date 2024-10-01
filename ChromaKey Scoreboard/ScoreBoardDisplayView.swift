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
        ZStack {
            // Use the green background (slightly transparent for visibility)
            Color.green.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) { // Stack score section and timer vertically with no spacing
                HStack(spacing: 0) {
                    // Team A Section (Abbreviated name on the left)
                    HStack(spacing: 8) {
                        Text(viewModel.teamA.name.prefix(3).uppercased()) // Use name abbreviation
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                    }
                    .padding(.vertical, 12)
                    .background(Color.red) // Background color for Team A

                    // Score Display Section
                    Text("\(viewModel.teamA.score) - \(viewModel.teamB.score)")
                        .font(.system(size: 24, weight: .bold))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color.purple) // Background for score section
                        .foregroundColor(.white)
                    
                    // Team B Section (Abbreviated name on the right)
                    HStack(spacing: 8) {
                        Text(viewModel.teamB.name.prefix(3).uppercased()) // Use name abbreviation
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                    }
                    .padding(.vertical, 12)
                    .background(Color.red) // Background color for Team B
                }
                .padding(.horizontal, 20) // Padding only on the sides, not on top/bottom
                .background(Color.white.opacity(0.15)) // Slight translucent white background for the entire scoreboard
                
                // Timer Section (Right below the score section)
                Text(timeString(time: viewModel.timeInSeconds))
                    .font(.system(size: 24, weight: .bold).monospacedDigit()) // Use monospaced digits
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.black) // Black background for timer
                    .foregroundColor(.white)
                    .frame(width: 120) // Slightly wider fixed width to handle both "9:59" and "10:00"
                    .multilineTextAlignment(.center) // Center text alignment
            }
        }
    }

    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds) // Format as "00:00"
    }

    struct ScoreboardDisplayView_Previews: PreviewProvider {
        static var previews: some View {
            ScoreboardDisplayView(viewModel: ScoreboardViewModel())
                .frame(width: 600, height: 150)
        }
    }
}
