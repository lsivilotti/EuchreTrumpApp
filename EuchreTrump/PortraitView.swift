//
//  SwiftUIView.swift
//  EuchreTrump
//
//  Created by Luca Sivilotti on 3/29/24.
//

import SwiftUI

struct PortraitView: View {
    @Environment (\.colorScheme) var colorScheme
    enum Suits {
        case spades, clubs, hearts, diamonds, none
    }
    @State var trump = Suits.none

    var body: some View {
        ZStack {
            Image(systemName: suitIcon(suit: trump))
                .resizable()
                .scaledToFit()
                .foregroundStyle(colorScheme == .dark ? .white : color(suit: trump))
            VStack {
                Text("Euchre")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(Color(red: 0.2, green: 0.4, blue: 0.9))
                Text("Trump is \(suitName(suit: trump))")
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                    .font(.title)
                    .background(Capsule().foregroundStyle(.white))
                    .foregroundStyle(.black)
                Spacer()
                HStack (spacing: 20) {
                    Spacer()
                    Divider()
                        .hidden()
                    VStack(alignment: .leading, spacing: 12) {
                        Label(
                            title: { Text("Jack") },
                            icon: { Image(systemName: suitIcon(suit: trump)) }
                        )
                        Label(
                            title: { Text("Jack") },
                            icon: { Image(systemName: coSuitIcon(suit: trump)) }
                        )
                        .foregroundStyle(.indigo)
                        .fontWeight(.black)
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
                    .foregroundStyle(colorScheme == .dark ? color(suit: trump) : .white)
                    .font(.system(size: 20))
                    Spacer()
                }
                .opacity(trump == .none ? 0.0 : 1)
                Spacer()
                HStack {
                    VStack {
                        suitButton(suit: .spades)
                        suitButton(suit: .clubs)
                    }
                    VStack {
                        suitButton(suit: .hearts)
                        suitButton(suit: .diamonds)
                    }
                }
            }
        }
        .background(colorScheme == .dark ? color(suit: trump) : .white)
    }
    
    func suitButton(suit:Suits) -> some View {
        return RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 190, height: 50, alignment: .center)
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
            .opacity(trump == suit ? 0.5 : 1)
            .foregroundStyle(colorScheme == .light ? color(suit: suit) : .white)
    }
    
    func color(suit:Suits) -> Color {
        switch(suit) {
        case .clubs, .spades:
            return .black
        case .hearts, .diamonds:
            return .red
        case .none:
            return .black
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
}

#Preview {
    PortraitView()
}
