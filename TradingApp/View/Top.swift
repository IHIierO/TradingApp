//
//  Top.swift
//  TradingApp
//
//  Created by Artem Vorobev on 14.05.2023.
//

import SwiftUI

struct Top: View {
    @StateObject var viewModel = TopViewViewModel()

    var body: some View {
            VStack {
                Text("TOP 10 Traders")
                    .font(.system(size: Constants.large_more_text_size, weight: .bold))
                TradersTableView()
                    .environmentObject(viewModel)
            }
    }
}

struct Top_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

