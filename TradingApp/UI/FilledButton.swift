//
//  FilledButton.swift
//  TradingApp
//
//  Created by Artem Vorobev on 14.05.2023.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    let color: Color
    let radius: CGFloat
    let height: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        
            configuration.label
            //.padding(.vertical, Constants.small_double_margin)
            .background {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .fill(color)
                    .frame(maxWidth: .infinity, maxHeight: height)
            }
            .frame(maxWidth: .infinity)
    }
}

struct FilledButton: View {
    let title: String
    let action: () -> Void
    let color: Color
    let radius: CGFloat
    let height: CGFloat
    let fontSize: CGFloat
    let alignment: Alignment

    var body: some View {
        Button {
            action()
        } label: {
            if alignment == .center {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: fontSize))
                .frame(maxWidth: .infinity, maxHeight: height)
                .padding()
            } else if alignment == .leading {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: fontSize))
                    .frame(maxWidth: .infinity, maxHeight: height, alignment: alignment)
                    .padding(.leading)
            }
        }
        .buttonStyle(CustomButton(color: color, radius: radius, height: height))
    }
}
