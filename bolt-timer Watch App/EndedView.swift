//
//  EndedView.swift
//  bolt-timer Watch App
//
//  Created by Kerdo Kurs on 01.05.2023.
//

import SwiftUI

struct EndedView: View {
    @Binding public var state: AppState
    public var result: RideResult
    
    var body: some View {
        VStack {
            VStack(spacing: 2) {
                Text("Ride finished!")
                Text("\(result.getCurrencyString())")
                    .font(.title)
                    .foregroundColor(.green)
                Text(result.getDurationString())
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button(action: {
                state = AppState.Home
            }) {
                Text("Home")
            }
        }
        .padding()
    }
}

struct EndedView_Previews: PreviewProvider {
    static var previews: some View {
        EndedView(
            state: .constant(AppState.Ended),
            result: RideResult(
                costPerMinute: 0.20
            )
        )
    }
}
