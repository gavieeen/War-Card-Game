//
//  ContentView.swift
//  War Card Game
//
//  Created by Gavin Ebenezer on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card2"
    @State var cpuCard = "card3"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    @State var winner = ""
    
    var body: some View {
        
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    deal()
                }, label: {
                    Image("button")
                })
                
                Spacer()
                
                Text(winner)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.title)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.title)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                
                Spacer()
            }
        }
        
    }
    
    func deal() {
        // Randomize player card
        let pCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(pCardValue)
        
        // Randomize CPU card
        let cCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cCardValue)
        
        // Update score
        if pCardValue > cCardValue {
            playerScore += 1
        }
        else if cCardValue > pCardValue {
            cpuScore += 1
        }
        winner = ""
        
        if cpuScore >= 10 || playerScore >= 10 {
            cpuScore = 0
            playerScore = 0
            winner = cpuScore >= 10 ? "CPU Wins" : "Player Wins"
        }
    }
    
}

#Preview {
    ContentView()
}
