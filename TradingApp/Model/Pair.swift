//
//  Pair.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import Foundation


enum Pair: String, CaseIterable {
    case gpb_usd = "GPB/USD"
    case eur_usd = "EUR/USD"
    case usd_jpy = "USD/JPY"
    case usd_chf = "USD/CHF"
    case aud_usd = "AUD/USD"
    case nzd_usd = "NZD/USD"
    case eur_gbp = "EUR/GBP"
    case eur_jpy = "EUR/JPY"
    case gbp_jpy = "GBP/JPY"
    case eur_chf = "EUR/CHF"
    case usd_cad = "USD/CAD"
    case aud_cad = "AUD/CAD"
    case aud_jpy = "AUD/JPY"
    case nzd_jpy = "NZD/JPY"
}
