//
//  TraderModel.swift
//  TradingApp
//
//  Created by Artem Vorobev on 14.05.2023.
//

import Foundation


struct TraderModel: Hashable, Equatable {
    var country: String
    var name: String
    var deposit: Int
    var profit: Int
    
    static func ==(lhs: TraderModel, rhs: TraderModel) -> Bool {
        return lhs.country == rhs.country && lhs.name == rhs.name && lhs.deposit == rhs.deposit && lhs.profit == rhs.profit
    }
}
