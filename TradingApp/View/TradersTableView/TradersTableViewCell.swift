//
//  TradersTableViewCell.swift
//  TradingApp
//
//  Created by Artem Vorobev on 14.05.2023.
//

import SwiftUI

struct TradersTableViewCell: View {
    
    var trader: TraderModel
    
    var body: some View {
        HStack(spacing: 10) {
            Image(trader.country)
                .padding()
            Text(trader.name)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .padding(.trailing)
            Text("$\(trader.deposit)")
                .padding()
            Text("$\(trader.profit)")
                .foregroundColor(.green)
                .padding()
        }
    }
}

struct TradersTableViewCell_Previews: PreviewProvider {
    static var previews: some View {
        TradersTableViewCell(trader: TraderModel(country: "013-italy", name: "Oliver", deposit: 2367, profit: 336755))
    }
}
