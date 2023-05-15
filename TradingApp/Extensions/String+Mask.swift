//
//  String+Mask.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import Foundation

extension String {
    func applyingMask(_ mask: String) -> String {

        let allowedCharacterSet = CharacterSet.decimalDigits
        let cleanedNumber = self.components(separatedBy: allowedCharacterSet.inverted).joined()

        var formattedString = ""
        var cleanedIndex = cleanedNumber.startIndex

        for maskIndex in mask.indices {
            guard cleanedIndex < cleanedNumber.endIndex else { break }
            let maskCharacter = mask[maskIndex]

            if maskCharacter == "X" {
                    formattedString.append(cleanedNumber[cleanedIndex])
                    cleanedIndex = cleanedNumber.index(after: cleanedIndex)
            } else {
                formattedString.append(maskCharacter)
            }
        }
        return formattedString + "$"
    }
}
