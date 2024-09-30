//
//  TeamView.swift
//  ChromaKey Scoreboard
//
//  Created by Cameron Tarbell on 9/30/24.
//

import SwiftUI

struct TeamView: View {
    @Binding var team: Team
    
    var body: some View {
        VStack {
            TextField("Team Name", text: $team.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("\(team.score)")
                .font(.system(size: 64))
                .padding()
            
            HStack {
                Button(action: {
                    team.score += 1
                }) {
                    Text("+")
                        .font(.title)
                        .frame(width: 50, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                Button(action: {
                    if team.score > 0 {
                        team.score -= 1
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
    }
}

struct TeamView_Previews: PreviewProvider {
    @State static var team = Team(name: "Team A", score: 0)
    
    static var previews: some View {
        TeamView(team: $team)
    }
}
