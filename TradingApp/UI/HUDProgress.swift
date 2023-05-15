//
//  HUDProgress.swift
//  TradingApp
//
//  Created by Artem Vorobev on 14.05.2023.
//

import SwiftUI

struct HUDProgressView: View {
    
    @Binding var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .center) {
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.black.opacity(0.08))
                    .frame(height: 20)
                Capsule()
                    .fill(Color.green)
                    .frame(width: callProgress() ,height: 20)
            }
            
            Text(String(format: "%.0f", progress * 100) + "%")
                .font(.system(size: Constants.middle_text_size, weight: .bold))
                .foregroundColor(.white)
            
        }
    }
    
    func callProgress() -> CGFloat {
        let width = UIScreen.main.bounds.width - Constants.middle_double_margin
        return width * progress
    }
}
