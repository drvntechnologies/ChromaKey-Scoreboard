//
//  ControlView.swift
//  ChromaKey Scoreboard
//
//  Created by Cameron Tarbell on 9/30/24.
//

import SwiftUI

struct ControlView: View {
    @ObservedObject var viewModel: ScoreboardViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            // Team A Controls
            VStack(alignment: .leading, spacing: 10) {
                Text("Team A")
                    .font(.headline)
                TextField("Team A Name", text: $viewModel.teamA.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Button(action: {
                        viewModel.teamA.score += 1
                    }) {
                        Text("+")
                            .font(.title)
                            .frame(width: 50, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    Button(action: {
                        if viewModel.teamA.score > 0 {
                            viewModel.teamA.score -= 1
                        }
                    }) {
                        Text("-")
                            .font(.title)
                            .frame(width: 50, height: 50)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
            }
            
            Divider()
            
            // Team B Controls
            VStack(alignment: .leading, spacing: 10) {
                Text("Team B")
                    .font(.headline)
                TextField("Team B Name", text: $viewModel.teamB.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Button(action: {
                        viewModel.teamB.score += 1
                    }) {
                        Text("+")
                            .font(.title)
                            .frame(width: 50, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    Button(action: {
                        if viewModel.teamB.score > 0 {
                            viewModel.teamB.score -= 1
                        }
                    }) {
                        Text("-")
                            .font(.title)
                            .frame(width: 50, height: 50)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
            }
            
            Divider()
            
            // Timer Controls
            VStack(alignment: .leading, spacing: 10) {
                Text("Timer")
                    .font(.headline)
                HStack {
                    Text(timeString(time: viewModel.timeInSeconds))
                        .font(.system(size: 32))
                        .frame(width: 100, alignment: .leading)
                    Toggle(isOn: $viewModel.isCountingDown) {
                        Text("Count Down")
                    }
                    .toggleStyle(SwitchToggleStyle())
                }
                HStack {
                    Button(action: {
                        if viewModel.isCountingDown && viewModel.timeInSeconds > 0 {
                            viewModel.timeInSeconds -= 60 // Decrease 1 minute
                        } else {
                            viewModel.timeInSeconds += 60 // Increase 1 minute
                        }
                    }) {
                        Image(systemName: "minus.circle")
                            .font(.largeTitle)
                    }
                    Spacer()
                    Button(action: {
                        if viewModel.isCountingDown && viewModel.timeInSeconds < 3600 {
                            viewModel.timeInSeconds += 60 // Increase 1 minute
                        } else {
                            viewModel.timeInSeconds += 60 // Increase 1 minute
                        }
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.largeTitle)
                    }
                }
            }
            
            Divider()
            
            // Timer Control Buttons
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
        .padding()
        .frame(width: 380, height: 600)
    }
    
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    struct ControlView_Previews: PreviewProvider {
        static var previews: some View {
            ControlView(viewModel: ScoreboardViewModel())
        }
    }
}
