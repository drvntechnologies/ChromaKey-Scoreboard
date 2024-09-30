//
//  TimerView.swift
//  ChromaKey Scoreboard
//
//  Created by Cameron Tarbell on 9/30/24.
//

import SwiftUI

struct TimerView: View {
    @Binding var timeInSeconds: Int
    @Binding var isCountingDown: Bool
    
    var body: some View {
        HStack {
            Text(timeString(time: timeInSeconds))
                .font(.system(size: 48))
                .padding()
            
            VStack {
                Toggle(isOn: $isCountingDown) {
                    Text("Count Down")
                }
                .padding()
                
                HStack {
                    Button(action: {
                        if isCountingDown && timeInSeconds > 0 {
                            timeInSeconds -= 60 // Decrease 1 minute
                        } else {
                            timeInSeconds += 60 // Increase 1 minute
                        }
                    }) {
                        Image(systemName: "minus.circle")
                            .font(.largeTitle)
                    }
                    Button(action: {
                        if isCountingDown && timeInSeconds < 3600 {
                            timeInSeconds += 60 // Increase 1 minute
                        } else {
                            timeInSeconds += 60 // Increase 1 minute
                        }
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.largeTitle)
                    }
                }
            }
        }
    }
    
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct TimerView_Previews: PreviewProvider {
    @State static var timeInSeconds = 600
    @State static var isCountingDown = true
    
    static var previews: some View {
        TimerView(timeInSeconds: $timeInSeconds, isCountingDown: $isCountingDown)
    }
}
