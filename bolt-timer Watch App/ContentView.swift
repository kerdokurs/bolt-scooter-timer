//
//  ContentView.swift
//  bolt-timer Watch App
//
//  Created by Kerdo Kurs on 01.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State var state: AppState = AppState.Home
    @State var rideResult: RideResult = RideResult(costPerMinute: 0.20)
    
    @ViewBuilder
    var body: some View {
        if state == AppState.Home {
            HomeView(state: $state, rideResult: $rideResult)
        } else if state == AppState.Running {
            RunningView(state: $state, rideResult: $rideResult)
        } else if state == AppState.Ended {
            EndedView(state: $state, result: rideResult)
        } else if state == AppState.SetCost {
            SetCostView(state: $state, rideResult: $rideResult)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
