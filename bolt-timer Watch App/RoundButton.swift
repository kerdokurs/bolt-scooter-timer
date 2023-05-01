//
//  RoundButton.swift
//  bolt-timer Watch App
//
//  Created by Kerdo Kurs on 01.05.2023.
//

import SwiftUI

struct RoundButton: View {
    var callback: () -> Void
    var text: String?
    var color: Color
    var iconName: String
    
    @ViewBuilder
    var body: some View {
        VStack {
            Button(action: callback) {
                Image(systemName: iconName)
                    .imageScale(.large)
                    .foregroundColor(color)
                    .padding()
            }
            .clipShape(Circle())
            .fixedSize()
            
            if text != nil && !text!.isEmpty {
                Text(text!)
                    .font(.subheadline)
            }
        }
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(callback: {
        }, color: .green, iconName: "play")
    }
}
