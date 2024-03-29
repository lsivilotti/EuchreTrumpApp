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
    enum suits {
        case spades, clubs, hearts, diamonds, none
    }
    @State var trump = suits.none

    var body: some View {
        ZStack {
            Image(systemName: suit == "___" ? "questionmark" : "suit.\(suit).fill")
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
                            icon: { Image(systemName: "suit.\(suit).fill") }
                        )
                        .foregroundStyle(suitColor)
                        Label(
                            title: { Text("Jack") },
                            icon: { Image(systemName: "suit.\(coSuit).fill") }
                        )
                        .foregroundStyle(Color(red: 0.5, green: 0.3, blue: 1))
                        .fontWeight(.heavy)
                        Label(
                            title: { Text("Ace") },
                            icon: { Image(systemName: "suit.\(suit).fill") }
                        )
                        .foregroundStyle(suitColor)
                        Label(
                            title: { Text("King") },
                            icon: { Image(systemName: "suit.\(suit).fill") }
                        )
                        .foregroundStyle(suitColor)
                        Label(
                            title: { Text("Queen") },
                            icon: { Image(systemName: "suit.\(suit).fill") }
                        )
                        .foregroundStyle(suitColor)
                        Label(
                            title: { Text("10") },
                            icon: { Image(systemName: "suit.\(suit).fill") }
                        )
                        .foregroundStyle(suitColor)
                        Label(
                            title: { Text("9") },
                            icon: { Image(systemName: "suit.\(suit).fill") }
                        )
                        .foregroundStyle(suitColor)
                    }
                    Spacer()
                }
                .opacity(suitColor == .white ? 0.0 : 1)
                Spacer()
                HStack {
                    VStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 190, height: 50, alignment: .center)
                            .overlay {
                                HStack {
                                    Image(systemName: "suit.spade.fill")
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
                                    suitColor = .white
                                } else {
                                    trump = .spades
                                    suit = "spade"
                                    coSuit = "club"
                                    suitColor = .black
                                }
                            }
                            .opacity(trump == .spades ? 0.5 : 1)
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 190, height: 50, alignment: .center)
                            .overlay {
                                HStack {
                                    Image(systemName: "suit.club.fill")
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
                                    suitColor = .white
                                } else {
                                    trump = .clubs
                                    suit = "club"
                                    coSuit = "spade"
                                    suitColor = .black
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
                                    Image(systemName: "suit.heart.fill")
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
                                    suitColor = .white
                                } else {
                                    trump = .hearts
                                    suit = "heart"
                                    coSuit = "diamond"
                                    suitColor = .red
                                }
                            }
                            .opacity(trump == .hearts ? 0.5 : 1)
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 190, height: 50, alignment: .center)
                            .overlay {
                                HStack {
                                    Image(systemName: "suit.diamond.fill")
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
                                    suitColor = .white
                                } else {
                                    trump = .diamonds
                                    suit = "diamond"
                                    coSuit = "heart"
                                    suitColor = .red
                                }
                            }
                            .opacity(trump == .diamonds ? 0.5 : 1)
                    }
                    .foregroundStyle(.red)
                }
            }
        }
        .background(suitColor)
    }
}

#Preview {
    ContentView()
}
