//
//  CustomTabBar.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab: Tab = .top
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TabView(selection: $currentTab) {
                    Trade()
                        .applyBG()
                        .tag(Tab.activity)
                    Top()
                        .applyBG()
                        .tag(Tab.top)
                }
                TabBarItems(currentTab: $currentTab)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
