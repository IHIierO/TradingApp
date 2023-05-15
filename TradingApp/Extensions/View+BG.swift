//
//  View+BG.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import SwiftUI

extension View {
    func applyBG()->some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
            }
    }
}
