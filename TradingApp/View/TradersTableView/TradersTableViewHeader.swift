//
//  TradersTableViewHeader.swift
//  TradingApp
//
//  Created by Artem Vorobev on 14.05.2023.
//

import SwiftUI

struct TradersTableViewHeader: View {
    
    private var footerLabel: [String] = ["№", "Counrty", "Name", "Deposit", "Profit"]
    var body: some View {
        HStack(spacing: Constants.small_margin) {
            ForEach(footerLabel, id: \.self) { str in
                if str == "№" {
                    Text(str)
                        .font(.system(size: Constants.small_text_size))
                } else {
                    Text(str)
                        .font(.system(size: Constants.small_text_size))
                        .padding()
                }
            }
        }
    }
}

struct TradersTableViewFooter_Previews: PreviewProvider {
    static var previews: some View {
        TradersTableViewHeader()
    }
}
