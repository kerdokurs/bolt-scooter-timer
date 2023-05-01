//
//  RideResult.swift
//  bolt-timer Watch App
//
//  Created by Kerdo Kurs on 01.05.2023.
//

import Foundation

class RideResult {
    public var CostPerMinute: Double
    
    private var totalTime: DateInterval?
    
    init(costPerMinute: Double) {
        self.CostPerMinute = costPerMinute
    }
    
    func updateTotalTime(time: DateInterval) -> Void {
        totalTime = time
    }
    
    func updateCostPerMinute(costPerMinute: Double) -> Void {
        CostPerMinute = costPerMinute
    }
    
    func reset() -> Void {
        totalTime = nil
    }
    
    func getTotalCost() -> Double {
        if totalTime == nil {
            return 0
        }
        
        let duration = totalTime!.duration
        return duration * (CostPerMinute / 60.0)
    }
    
    func getTotalCostFormatted() -> String {
        return RideResult.formatCurrency(amount: getTotalCost())
    }
    
    func getCostPerMinuteFormatted() -> String {
        return RideResult.formatCurrency(amount: CostPerMinute)
    }

    
    func getDuration() -> DateInterval? {
        return totalTime
    }
    
    func getDurationString() -> String {
        if totalTime == nil {
            return "ERROR"
        }
        
        let duration = totalTime!.duration
        let durationMins = Int(duration / 60)
        let durationSecs = Int(duration.truncatingRemainder(dividingBy: 60))

        return String(format: "%02d:%02d", durationMins, durationSecs)
    }
    
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        
        return formatter;
    }()
    
    static func formatCurrency(amount: Double) -> String {
        return currencyFormatter.string(from: NSNumber(value: amount))!
    }
}
