//
//  RunningView.swift
//  bolt-timer Watch App
//
//  Created by Kerdo Kurs on 01.05.2023.
//

import SwiftUI
import Foundation

struct RunningView: View {
    @Binding public var state: AppState
    
    @Binding public var rideResult: RideResult
    
    @State var startDate = Date.now
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    let gpsTimer = Timer.publish(every: 5, on: .main, in: .common)
        .autoconnect()
    
    @State var totalCost: Double = 0
    @State var durationMins: Int = 0
    @State var durationSecs: Int = 0
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                RoundButton(callback: {
                    rideResult.updateTotalTime(
                        time: DateInterval(start: startDate, end: Date.now)
                    )
                    
                    state = AppState.Ended
                }, color: .red, iconName: "stop")
                .padding(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 3) {
                    Text("\(formatCurrency(amount: totalCost))")
                        .font(.title)
                        .foregroundColor(.green)
                        .onReceive(timer) { input in
                            let interval = DateInterval(start: startDate, end: input)
                            let costPerSecond = rideResult.CostPerMinute / 60.0
                            totalCost = costPerSecond * interval.duration
                            
                            durationMins = Int(interval.duration / 60)
                            durationSecs = Int(interval.duration.truncatingRemainder(dividingBy: 60))
                        }
                    
                    Text("\(String(format: "%02d", durationMins)):\(String(format: "%02d", durationSecs))")
                        .font(.headline)
                    
                    Text("\(formatCurrency(amount: rideResult.CostPerMinute))/min")
                }
                
            }
            
            Spacer()
        }
        .padding()
    }
    
    func formatCurrency(amount: Double) -> String {
        return RideResult.formatCurrency(amount: amount)
    }
}

struct RunningView_Previews: PreviewProvider {
    @State var result: RideResult?
    
    static var previews: some View {
        RunningView(
            state: .constant(AppState.Running),
            rideResult: .init(get: {
                return RideResult(
                    costPerMinute: 0.20
                )
            }, set: { result in
            })
        )
    }
}

