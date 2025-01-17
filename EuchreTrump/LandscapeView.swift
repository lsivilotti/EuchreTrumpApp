//
//  SwiftUIView.swift
//  EuchreTrump
//
//  Created by Luca Sivilotti on 3/29/24.
//

import SwiftUI

struct LandscapeView: View {
    enum Suits {
        case spades, clubs, hearts, diamonds, none
    }
    @State var trump : Suits = Suits.none
    @Environment (\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Text("Euchre")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(Color(red: 0.2, green: 0.4, blue: 0.9))
            HStack {
                VStack(spacing: 20) {
                    suitButton(suit: .spades)
                    suitButton(suit: .clubs)
                    suitButton(suit: .hearts)
                    suitButton(suit: .diamonds)
                }
                Spacer()
                VStack {
                    Image(systemName: suitIcon(suit: trump))
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(colorScheme == .dark && (trump == .spades || trump == .clubs) ? .white : color(suit: trump))
                        .padding()
                }
                Spacer()
                VStack {
                    HStack (spacing: 20) {
                        VStack(alignment: .leading, spacing: 12) {
                            Label(
                                title: { Text("Jack") },
                                icon: { Image(systemName: suitIcon(suit: trump)) }
                            )
                            Label(
                                title: { Text("Jack") },
                                icon: { Image(systemName: coSuitIcon(suit: trump)) }
                            )
                            .foregroundStyle(colorScheme == .dark ? Color(red: 1, green: 1, blue: 0) : .purple)
                            .fontWeight(.heavy)
                            Label(
                                title: { Text("Ace") },
                                icon: { Image(systemName: suitIcon(suit: trump)) }
                            )
                            Label(
                                title: { Text("King") },
                                icon: { Image(systemName: suitIcon(suit: trump)) }
                            )
                            Label(
                                title: { Text("Queen") },
                                icon: { Image(systemName: suitIcon(suit: trump)) }
                            )
                            Label(
                                title: { Text("10") },
                                icon: { Image(systemName: suitIcon(suit: trump)) }
                            )
                            Label(
                                title: { Text("9") },
                                icon: { Image(systemName: suitIcon(suit: trump)) }
                            )
                        }
                        .foregroundStyle(colorScheme == .dark && (trump == .spades || trump == .clubs) ? .white : color(suit: trump))
                        .font(.title)
                    }
                    .opacity(trump == .none ? 0.0 : 1)
                }
            }
        }
    }
    
    func suitButton(suit:Suits) -> some View {
        return RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 220, height: 60, alignment: .center)
            .overlay {
                HStack {
                    Image(systemName: suitIcon(suit: suit))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 45)
                    Text(suitName(suit: suit).capitalized)
                        .fontWeight(.black)
                        .font(.title)
                }
                .foregroundStyle(colorScheme == .light ? .white : color(suit: suit))
            }
            .onTapGesture {
                if(trump == suit) {
                    trump = .none
                } else {
                    trump = suit
                }
            }
            .shadow(color: trump == suit ? .green : .clear, radius: 20)
            .foregroundStyle(colorScheme == .light ? color(suit: suit) : .white)
    }
    
    func color(suit:Suits) -> Color {
        switch(suit) {
        case .clubs, .spades:
            return .black
        case .hearts, .diamonds:
            return .red
        case .none:
            return .green
        }
    }
    
    func suitIcon(suit:Suits) -> String {
        switch(suit){
        case .spades:
            return "suit.spade.fill"
        case .clubs:
            return "suit.club.fill"
        case .hearts:
            return "suit.heart.fill"
        case .diamonds:
            return "suit.diamond.fill"
        case .none:
            return "questionmark"
        }
    }
    
    func coSuitIcon(suit:Suits) -> String {
        switch(suit){
        case .spades:
            return "suit.club.fill"
        case .clubs:
            return "suit.spade.fill"
        case .hearts:
            return "suit.diamond.fill"
        case .diamonds:
            return "suit.heart.fill"
        case .none:
            return "questionmark"
        }
    }
    
    func suitName(suit:Suits) -> String {
        switch(suit){
        case .spades:
            return "spades"
        case .clubs:
            return "clubs"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .none:
            return "undecided"
        }
    }
    
    func getTrump() -> Suits {
        return trump
    }
}

#Preview {
    LandscapeView()
}
