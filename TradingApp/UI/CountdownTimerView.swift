//
//  CountdownTimerView.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import SwiftUI

struct CountdownTimerView: View {
    @Binding var timeRemaining: Int
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    var body: some View {
        TextField("", text: timeString(time: timeRemaining))
            .disabled(true)
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 10
                }
            }
    }

    func timeString(time: Int) -> Binding<String>{
        let seconds = (time / 1000) % 60
        let minutes = (time / (1000 * 60)) % 60
        let formattedString = String(format: "%02d:%02d", minutes, seconds)
            let binding = Binding<String>(get: {
                return formattedString
            }, set: { _ in })
            
            return binding
    }
}
