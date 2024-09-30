//
//  ScoreboardViewModel.swift
//  ChromaKey Scoreboard
//
//  Created by Cameron Tarbell on 9/30/24.
//

import SwiftUI
import Combine

struct Team {
    var name: String
    var score: Int
}

class ScoreboardViewModel: ObservableObject {
    @Published var teamA: Team = Team(name: "Team A", score: 0)
    @Published var teamB: Team = Team(name: "Team B", score: 0)
    
    @Published var isCountingDown: Bool = false
    @Published var timeInSeconds: Int = 600 // Default 10 minutes
    
    private var timer: AnyCancellable?
    
    func startTimer() {
        timer?.cancel()
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.isCountingDown {
                    if self.timeInSeconds > 0 {
                        self.timeInSeconds -= 1
                    } else {
                        self.timer?.cancel()
                    }
                } else {
                    self.timeInSeconds += 1
                }
            }
    }
    
    func stopTimer() {
        timer?.cancel()
    }
    
    func resetTimer() {
        timer?.cancel()
        timeInSeconds = isCountingDown ? 600 : 0
    }
}
