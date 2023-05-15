//
//  CurrencyPair.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import SwiftUI

struct CurrencyPair: View {
    @EnvironmentObject var viewModel: TradeViewViewModel
    @Environment(\.presentationMode) var presentationMode
    
    let pairs: [Pair] = Pair.allCases
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Text("Currency pair")
                .font(.system(size: Constants.large_more_text_size, weight: .black))
                .padding(.bottom)
            ScrollView {
                LazyVGrid(columns: columns, spacing: Constants.large_margin) {
                    ForEach(pairs, id: \.self) { pair in
                        FilledButton(title: pair.rawValue, action: {
                            viewModel.currentPair = pair
                            presentationMode.wrappedValue.dismiss()
                        }, color: viewModel.currentPair == pair ? .green : .white.opacity(0.1), radius: Constants.btn_radius, height: Constants.button_height, fontSize: Constants.middle_text_size, alignment: .center)
                        .padding(.horizontal, Constants.small_margin)
                    }
                }
                .padding(Constants.middle_margin)
            }
        }
    }
}

struct CurrencyPair_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var viewModel = TradeViewViewModel()
        CurrencyPair().environmentObject(viewModel)
    }
}
