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

    var body: some View {
        Group {
            switch orientation {
            case .unknown:
                PortraitView()
            case .portrait:
                PortraitView()
            case .portraitUpsideDown:
                LandscapeView()
            case .landscapeLeft:
                LandscapeView()
            case .landscapeRight:
                LandscapeView()
            case .faceUp:
                PortraitView()
            case .faceDown:
                PortraitView()
            @unknown default:
                PortraitView()
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

#Preview {
    ContentView()
}
