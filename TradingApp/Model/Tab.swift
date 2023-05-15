//
//  Tab.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import Foundation

enum Tab: String, CaseIterable {
    case activity = "activityBarItem"
    case top = "topBarItem"
    
    var tabBarItemName: String {
        switch self {
        case .activity:
            return "Trade"
        case .top:
            return "Top"
        }
    }
}
