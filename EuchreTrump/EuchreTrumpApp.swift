//
//  EuchreTrumpApp.swift
//  EuchreTrump
//
//  Created by Luca Sivilotti on 3/28/24.
//

import SwiftUI

@main
struct EuchreTrumpApp: App {
//TODO - Find the @Environment to read when the screen is in portrait vs landscape
    @State var orientation : UIDeviceOrientation = UIDevice.current.orientation
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
