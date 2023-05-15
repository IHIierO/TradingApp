//
//  BuyButton.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import SwiftUI

struct BuyButton<Content: View>: View {
    
    let content: Content
    let title: String
    let minusAction: () -> Void
    let addAction: () -> Void
    
    var body: some View {
        VStack(spacing: Constants.small_half_margin) {
            Text(title)
            HStack(spacing: Constants.middle_half_margin) {
                Spacer()
                Button {
                    minusAction()
                } label: {
                    Image("minus-cirlce")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.small_icon_size)
                }
                
                
                content
                
                Button {
                    addAction()
                } label: {
                    Image("add-circle")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.small_icon_size)
                }
                Spacer()
            }
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .frame(height: Constants.button_height)
        .padding(.vertical, Constants.small_half_margin)
        .background {
            RoundedRectangle(cornerRadius: Constants.btn_radius, style: .continuous)
                .fill(Color.white.opacity(0.1))
                .frame(maxWidth: .infinity)
                //.padding(.horizontal, Constants.large_margin)
        }
    }
}

struct BuyButton_Previews: PreviewProvider {
    static var previews: some View {
        BuyButton(content: Text("00:00"), title: "Timer") {
            
        } addAction: {
            
        }
    }
}
