//
//  SetCostView.swift
//  bolt-timer Watch App
//
//  Created by Kerdo Kurs on 02.05.2023.
//

import SwiftUI
import Combine

struct SetCostView: View {
    @Binding public var state: AppState
    @Binding public var rideResult: RideResult
    
    @State var costPerMinute: Double = 0.2
    
    var body: some View {
        VStack {
            Text(rideResult.getCostPerMinuteFormatted())
                .font(.title)
                .foregroundColor(.green)
                .focusable(true)
                .digitalCrownRotation($costPerMinute, from: 0, through: 1.0, by: 0.01, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
                .onReceive(Just(costPerMinute)) { cpm in
                    rideResult.updateCostPerMinute(costPerMinute: cpm)
                }
            
            Button(action: {
                rideResult.updateCostPerMinute(costPerMinute: costPerMinute)
                state = AppState.Home
            }, label: {
                Text("OK")
            })
        }
    }
}

struct SetCostView_Previews: PreviewProvider {
    static var previews: some View {
        SetCostView(
            state: .constant(AppState.SetCost),
            rideResult: .init(get: {
                return RideResult(costPerMinute: 0.20)
            }, set: { result in
                print(result)
            })
        )
    }
}
