//
//  TradeViewViewModel.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import SwiftUI

final class TradeViewViewModel: ObservableObject {
    @Published var balance: Int = 15750
    @Published var timer: Int = 30000
    @Published var investment: String = "100$"
    @Published var currentPair: Pair = .gpb_usd
    @Published var urlString: String = "https://www.tradingview.com/chart/"
    @Published var alertItem: AlertItem?
    
    func updateInvestment(for mask: String) {
        if investment.count > mask.count {
            investment.removeSubrange(investment.index(investment.startIndex, offsetBy: mask.count)...)
            }
        }
    
    func minusInvestment() {
        if investment.count <= 4 {
            if var investmentInt = Int(investment.replacingOccurrences(of: "$", with: "")) {
                if investmentInt <= 100 {
                    investmentInt -= 0
                } else {
                    investmentInt -= 100
                }
                investment = String("\(investmentInt)$")
            }
        } else {
            let investmentReplacing = investment.replacingOccurrences(of: "$", with: "")
            if var investmentInt = Int(investmentReplacing.replacingOccurrences(of: ",", with: "")) {
                if investmentInt <= 100 {
                    investmentInt -= 0
                } else {
                    investmentInt -= 100
                }
                investment = String("\(investmentInt)$")
            }
        }
    }
    
    func addInvestment() {
        if investment.count <= 4 {
            if var investmentInt = Int(investment.replacingOccurrences(of: "$", with: "")) {
                if investmentInt >= 9999 {
                    investmentInt += 0
                } else {
                    investmentInt += 100
                }
                investment = String("\(investmentInt)$")
            }
        } else {
            let investmentReplacing = investment.replacingOccurrences(of: "$", with: "")
            if var investmentInt = Int(investmentReplacing.replacingOccurrences(of: ",", with: "")) {
                if investmentInt >= 9999 {
                    investmentInt += 0
                } else {
                    investmentInt += 100
                }
                investment = String("\(investmentInt)$")
            }
        }
    }
}
