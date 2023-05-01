//
//  StartView.swift
//  bolt-timer Watch App
//
//  Created by Kerdo Kurs on 01.05.2023.
//

import SwiftUI

struct HomeView: View {
    @Binding public var state: AppState
    @Binding public var rideResult: RideResult
    
    var body: some View {
        VStack {
            RoundButton(callback: {
                rideResult.reset()
                state = AppState.Running
            }, color: .green, iconName: "play")
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            state: .constant(AppState.Home),
            rideResult: .init(get: {
                return RideResult(costPerMinute: 0.20)
            }, set: { result in
                print(result)
            })
        )
    }
}
