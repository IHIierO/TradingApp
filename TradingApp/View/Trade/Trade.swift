//
//  Trade.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import SwiftUI

struct Trade: View {
    
    @StateObject var viewModel = TradeViewViewModel()
    @FocusState private var focusItem: Bool
    var body: some View {
        VStack {
            Text("Trade")
                .font(.system(size: Constants.large_more_text_size, weight: .black))
                .padding(.bottom)
            
            VStack(alignment: .center, spacing: Constants.middle_half_margin) {
                Text("Balance")
                    .font(.system(size: Constants.middle_text_size))
                    .padding(.top, Constants.middle_half_margin)
                Text("\(viewModel.balance)$")
                    .font(.system(size: Constants.large_less_text_size, weight: .bold))
                    .padding(.bottom, Constants.middle_half_margin)
            }
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: Constants.btn_radius, style: .continuous)
                    .fill(Color.white.opacity(0.1))
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, Constants.large_margin)
            }
            
            if let url = URL(string: viewModel.urlString) {
                WebView(url: url)
                    .padding(.vertical)
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            
            NavigationLink(
                destination: CurrencyPair()
                    .environmentObject(viewModel)
                    .applyBG
                
            ) {
                HStack {
                    Spacer()
                    Text(viewModel.currentPair.rawValue)
                    Spacer()
                    Image("arrow-left")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.middle_icon_size)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: Constants.btn_radius, style: .continuous)
                        .fill(Color.white.opacity(0.1))
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, Constants.large_margin)
            .padding(.bottom, Constants.small_half_margin)
            
            HStack(spacing: Constants.middle_margin) {
                BuyButton(
                    content: CountdownTimerView(timeRemaining: $viewModel.timer)
                        .multilineTextAlignment(.center)
                    , title: "Timer") {
                        if viewModel.timer <= 30000 {
                            viewModel.timer = 0
                        } else {
                            viewModel.timer -= 30000
                        }
                    } addAction: {
                        viewModel.timer += 30000
                    }
                
                BuyButton(
                    content: TextField("", text: Binding(
                        get: {(viewModel.investment)},
                        set: {
                            if viewModel.investment.count <= 4 {
                                viewModel.investment = $0.applyingMask("XXX$")
                            } else {
                                viewModel.investment = $0.applyingMask("X,XXX$")
                            }
                        }))
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($focusItem)
                    .toolbar{
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                focusItem = false
                            }
                        }
                    }
                        .onSubmit {
                            if viewModel.investment.count <= 4 {
                                viewModel.updateInvestment(for: "XXX$")
                            } else {
                                viewModel.updateInvestment(for: "X,XXX$")
                            }
                        }
                    
                    , title: "Investment") {
                        viewModel.minusInvestment()
                    } addAction: {
                        viewModel.addInvestment()
                    }
            }
            .padding(.horizontal)
            HStack(spacing: 20) {
                FilledButton(title: "Sell", action: {
                    viewModel.alertItem = AlertItem(title: .init("successfully"), message: .init(""))
                }, color: .red, radius: Constants.btn_radius, height: Constants.button_height, fontSize: Constants.large_more_text_size, alignment: .leading)
                
                FilledButton(title: "Buy", action: {
                    viewModel.alertItem = AlertItem(title: .init("successfully"), message: .init(""))
                }, color: .green, radius: Constants.btn_radius, height: Constants.button_height, fontSize: Constants.large_more_text_size, alignment: .leading)
            }
            .padding(.horizontal)
            .padding(.top, Constants.small_half_margin)
            .padding(.bottom)
            .alert(item: $viewModel.alertItem) { item in
                Alert(title: item.title, message: item.message, dismissButton: .cancel())
            }
        }
    }
}

struct Trade_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
