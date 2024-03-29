//
//  ContentView.swift
//  EuchreTrump
//
//  Created by Luca Sivilotti on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    @State var suit: String = "___"
    @State var coSuit: String = "___"
    @State var suitColor: Color = .white
    enum Suits {
        case spades, clubs, hearts, diamonds, none
    }
    @State var trump = Suits.none

    var body: some View {
        ZStack {
            Image(systemName: suitIcon(suit: trump))
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white)
            VStack {
                Text("Euchre")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(suit == "___" ? Color(red: 0.4, green: 0.6, blue: 1) : Color(red: 0.7, green: 0.9, blue: 1))
                Text("Trump is \(suit != "___" ? "\(suit)s" : "undecided")")
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
                        .foregroundStyle(color(suit: trump))
                        Label(
                            title: { Text("Jack") },
                            icon: { Image(systemName: "suit.\(coSuit).fill") }
                        )
                        .foregroundStyle(Color(red: 0.5, green: 0.3, blue: 1))
                        .fontWeight(.heavy)
                        Label(
                            title: { Text("Ace") },
                            icon: { Image(systemName: suitIcon(suit: trump)) }
                        )
                        .foregroundStyle(color(suit: trump))
                        Label(
                            title: { Text("King") },
                            icon: { Image(systemName: suitIcon(suit: trump)) }
                        )
                        .foregroundStyle(color(suit: trump))
                        Label(
                            title: { Text("Queen") },
                            icon: { Image(systemName: suitIcon(suit: trump)) }
                        )
                        .foregroundStyle(color(suit: trump))
                        Label(
                            title: { Text("10") },
                            icon: { Image(systemName: suitIcon(suit: trump)) }
                        )
                        .foregroundStyle(color(suit: trump))
                        Label(
                            title: { Text("9") },
                            icon: { Image(systemName: suitIcon(suit: trump)) }
                        )
                        .foregroundStyle(color(suit: trump))
                    }
                    Spacer()
                }
                .opacity(trump == .none ? 0.0 : 1)
                Spacer()
                HStack {
                    VStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 190, height: 50, alignment: .center)
                            .overlay {
                                HStack {
                                    Image(systemName: suitIcon(suit: .spades))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 45)
                                    Text("Spades")
                                        .fontWeight(.black)
                                        .font(.title)
                                }
                                .foregroundStyle(.white)
                            }
                            .onTapGesture {
                                if(trump == .spades) {
                                    trump = .none
                                    suit = "___"
                                    coSuit = "___"
                                } else {
                                    trump = .spades
                                    suit = "spade"
                                    coSuit = "club"
                                }
                            }
                            .opacity(trump == .spades ? 0.5 : 1)
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 190, height: 50, alignment: .center)
                            .overlay {
                                HStack {
                                    Image(systemName: suitIcon(suit: .clubs))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 45)
                                    Text("Clubs")
                                        .fontWeight(.black)
                                        .font(.title)
                                }
                                .foregroundStyle(.white)
                            }
                            .onTapGesture {
                                if(trump == .clubs) {
                                    trump = .none
                                    suit = "___"
                                    coSuit = "___"
                                } else {
                                    trump = .clubs
                                    suit = "club"
                                    coSuit = "spade"
                                }
                            }
                            .opacity(trump == .clubs ? 0.5 : 1)
                    }
                    .foregroundStyle(.black)
                    VStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 190, height: 50, alignment: .center)
                            .overlay {
                                HStack {
                                    Image(systemName: suitIcon(suit: .hearts))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 45)
                                    Text("Hearts")
                                        .fontWeight(.black)
                                        .font(.title)
                                }
                                .foregroundStyle(.white)
                            }
                            .onTapGesture {
                                if(trump == .hearts) {
                                    trump = .none
                                    suit = "___"
                                    coSuit = "___"
                                } else {
                                    trump = .hearts
                                    suit = "heart"
                                    coSuit = "diamond"
                                }
                            }
                            .opacity(trump == .hearts ? 0.5 : 1)
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 190, height: 50, alignment: .center)
                            .overlay {
                                HStack {
                                    Image(systemName: suitIcon(suit: .diamonds))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 45)
                                    Text("Diamonds")
                                        .fontWeight(.black)
                                        .font(.title)
                                }
                                .foregroundStyle(.white)
                            }
                            .onTapGesture {
                                if(trump == .diamonds) {
                                    trump = .none
                                    suit = "___"
                                    coSuit = "___"
                                } else {
                                    trump = .diamonds
                                    suit = "diamond"
                                    coSuit = "heart"
                                }
                            }
                            .opacity(trump == .diamonds ? 0.5 : 1)
                    }
                    .foregroundStyle(.red)
                }
            }
        }
        .background(color(suit: trump))
    }
    
    func color(suit:Suits) -> Color {
        switch(suit) {
        case .clubs, .spades:
            return .black
        case .hearts, .diamonds:
            return .red
        case .none:
            return .white
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
}

#Preview {
    ContentView()
}
