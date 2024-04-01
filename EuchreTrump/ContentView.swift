//
//  ContentView.swift
//  EuchreTrump
//
//  Created by Luca Sivilotti on 3/28/24.
//

import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
/*previous 16 lines found on Hacking with Swift: How to detect device rotation
 * https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-device-rotation
 */

struct ContentView: View {
    enum Suits {
            case spades, clubs, hearts, diamonds, none
        }
    @State var trump: Suits = Suits.none
    @State var orientation: UIDeviceOrientation = UIDevice.current.orientation
    @State var prevOrientation: UIDeviceOrientation = UIDevice.current.orientation
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        Group {
            switch orientation {
            case .unknown:
                landscape()
            case .portrait:
                portrait()
            case .portraitUpsideDown:
                landscape()
            case .landscapeLeft:
                landscape()
            case .landscapeRight:
                landscape()
            case .faceUp:
                if prevOrientation == .portrait || prevOrientation == .portraitUpsideDown {
                    portrait()
                } else {
                    landscape()
                }
            case .faceDown:
                if prevOrientation == .portrait || prevOrientation == .portraitUpsideDown {
                    portrait()
                } else {
                    landscape()
                }
            @unknown default:
                if prevOrientation == .portrait || prevOrientation == .portraitUpsideDown {
                    portrait()
                } else {
                    landscape()
                }
            }
        }
        .onRotate { newOrientation in
            prevOrientation = orientation
            orientation = newOrientation
        }
    }
    
    func portrait() -> some View {
        ZStack {
            icon()
                .foregroundStyle(colorScheme == .dark ? .white : color(suit: trump))
            VStack {
                titleText()
                HStack {
                    Spacer()
                    Text("Trump is \(suitName(suit: trump))")
                        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                        .font(.title)
                        .foregroundStyle(.black)
                    Spacer()
                }
                .background(.white)
                Spacer()
                HStack (spacing: 20) {
                    Spacer()
                    Divider()
                        .hidden()
                    cardOrder()
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
    
    func landscape() -> some View {
        VStack {
            titleText()
            HStack {
                VStack(spacing: 20) {
                    suitButton(suit: .spades)
                    suitButton(suit: .clubs)
                    suitButton(suit: .hearts)
                    suitButton(suit: .diamonds)
                }
                Spacer()
                VStack {
                    icon()
                        .foregroundStyle(colorScheme == .dark && (trump == .spades || trump == .clubs) ? .white : color(suit: trump))
                        .padding()
                }
                Spacer()
                cardOrder()
                    .foregroundStyle(colorScheme == .dark && (trump == .spades || trump == .clubs) ? .white : color(suit: trump))
                    .font(.title)
                    .opacity(trump == .none ? 0.0 : 1)
            }
        }
    }
    
    func suitButton(suit:Suits) -> some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 190, height: 60, alignment: .center)
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
    
    func cardOrder() -> some View {
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
    }
    
    func titleText() -> some View {
        Text("Euchre")
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundStyle(Color(red: 0.2, green: 0.4, blue: 0.9))
    }
    
    func icon() -> some View {
        Image(systemName: suitIcon(suit: trump))
            .resizable()
            .scaledToFit()
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
    
}

#Preview {
    ContentView()
}
