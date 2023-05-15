//
//  TopViewViewModel.swift
//  TradingApp
//
//  Created by Artem Vorobev on 14.05.2023.
//

import SwiftUI

class TopViewViewModel: ObservableObject {
    @Published var flagImages: [String] = []
    @Published var traders: [TraderModel] = []
    
    init() {
        loadFlagImages()
        traders = createTraderModels()
    }

    func loadFlagImages() {
        let fileManager = FileManager.default
        let bundleURL = Bundle.main.bundleURL
        let assetURL = bundleURL.appendingPathComponent("Flags")

        do {
            let contents = try fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
            print("Image count: \(contents.count)")

            for item in contents {
                if let imageName = item.lastPathComponent.split(separator: ".").first {
                    flagImages.append("\(imageName)")
                }
            }
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
    func createTraderModels() -> [TraderModel] {
        var traderModels: [TraderModel] = []
        
        let names = ["Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Heidi", "Ivan", "Judy"]
        var randomFlags: [String] = []
        for _ in 1...10 {
            if let randomFlag = flagImages.randomElement() {
                randomFlags.append(randomFlag)
            }
        }
        
        for i in 0..<10 {
            let name = names[i]
            let country = randomFlags[i]
            let deposit = Int.random(in: 100..<1000)
            let profit = Int.random(in: 100..<1000)
            
            let traderModel = TraderModel(country: country, name: name, deposit: deposit, profit: profit)
            
            traderModels.append(traderModel)
        }
        
        traderModels.sort { $0.profit > $1.profit }
        
        return traderModels
    }
    
    func updatingTraderModels() {
        let randomIndex = Int.random(in: 0..<10)
        let randomDepositIncrease = Int.random(in: 50..<150)
        let randomProfitIncrease = Int.random(in: 50..<150)
        
        traders[randomIndex].deposit += randomDepositIncrease
        traders[randomIndex].profit += randomProfitIncrease
        
        traders.sort { $0.profit > $1.profit }
        }
}


