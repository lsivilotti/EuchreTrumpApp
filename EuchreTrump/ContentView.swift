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
    @State var orientation: UIDeviceOrientation = UIDevice.current.orientation
    @State var prevOrientation: UIDeviceOrientation = UIDevice.current.orientation

    var body: some View {
        Group {
            switch orientation {
            case .unknown:
                LandscapeView()
            case .portrait:
                PortraitView()
            case .portraitUpsideDown:
                PortraitView()
            case .landscapeLeft:
                LandscapeView()
            case .landscapeRight:
                LandscapeView()
            case .faceUp:
                if prevOrientation == .portrait || prevOrientation == .portraitUpsideDown {
                    PortraitView()
                } else {
                    LandscapeView()
                }
            case .faceDown:
                if prevOrientation == .portrait || prevOrientation == .portraitUpsideDown {
                    PortraitView()
                } else {
                    LandscapeView()
                }
            @unknown default:
                LandscapeView()
            }
        }
        .onRotate { newOrientation in
            prevOrientation = orientation
            orientation = newOrientation
        }
    }
}

#Preview {
    ContentView()
}
