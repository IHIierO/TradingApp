//
//  TradersTableView.swift
//  TradingApp
//
//  Created by Artem Vorobev on 14.05.2023.
//

import SwiftUI

struct TradersTableView: View {
    @EnvironmentObject var viewModel: TopViewViewModel
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        List{
            Section {
                TradersTableViewHeader()
                ForEach(viewModel.traders.indices, id: \.self) { index in
                    let trader = viewModel.traders[index]
                    HStack(spacing: 10) {
                        Text("\(index + 1)")
                        TradersTableViewCell(trader: trader)
                    }
                    .listRowBackground(index % 2 == 0 ? Color.clear : Color.white.opacity(0.1))
                }
            }
        }
        
        .listRowSeparator(.hidden)
        .onReceive(timer) { _ in
            viewModel.updatingTraderModels()
            }
    }
}

struct TradersTableView_Previews: PreviewProvider {
    static var previews: some View {
        Top()
    }
}
