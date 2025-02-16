//
//  ContentView.swift
//  War Card Game
//
//  Created by Sai Vikshit Kode on 2/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var PlayerCard = "card7"
    @State var CPUCard = "card13"
    
    @State var PScore:Int = 0
    @State var CScore:Int = 0
    
    @State var WinStatement:String = ""
    
    var body: some View {
        
        ZStack {
            Image("background-plain").resizable().ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                
                if WinStatement == "Player Wins!"{
                    Text(WinStatement).font(.title3).foregroundColor(.green).fontWeight(.bold)
                }
                else if WinStatement == "CPU Wins!"{
                    Text(WinStatement).font(.title3).foregroundColor(.red).fontWeight(.bold)
                }
                else if WinStatement == "Tie!"{
                    Text("Tie").font(.title3).foregroundColor(.white).fontWeight(.bold)
                }
                else{}
                
                Spacer()
                
                HStack {
                    Spacer()
                    Image(PlayerCard)
                    Spacer()
                    Image(CPUCard)
                    Spacer()
                    
                    
                }
                Spacer()
                
                
                Button {
                    Deal()
                } label: {
                    Image("button")
                }
                
                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player").font(.headline).padding(.bottom, 10)
                        Text(String(PScore)).font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU").font(.headline).padding(.bottom, 10)
                        Text(String(CScore)).font(.largeTitle)
                    }
                    
                    Spacer()
                    
                }.foregroundColor(.white)
                Spacer()
                Button{
                    reset()
                } label: {
                    Text("Reset").foregroundColor(.white).frame(width: 200, height: 50)
                }
            }
        }
        
    }
    
    
    func reset() {
        PScore = 0
        CScore = 0
        PlayerCard = "card2"
        CPUCard = "card3"
        WinStatement = ""
    }
    
    func Deal() {
        // Randomize the Players card
        let PlayerCardValue = Int.random(in: 2...14)
        PlayerCard = "card" + String(PlayerCardValue)
        // Randomize the CPU Card
        let CPUCardValue = Int.random(in: 2...14)
        CPUCard = "card" + String(CPUCardValue)
        // Update the Scores
        if PlayerCardValue > CPUCardValue {
            PScore += 1
            Winstatement()
        } else if CPUCardValue > PlayerCardValue {
            CScore += 1
            Winstatement()
        }
        
        func Winstatement() {
            if PlayerCardValue > CPUCardValue {
                WinStatement = "Player Wins!"
            }
            else if CPUCardValue > PlayerCardValue {
                WinStatement = "CPU Wins!"
            }
            else {
                WinStatement = "Tie!"
            }
        }
    }
}

#Preview {
    ContentView()
}
