//
//  TabBarItems.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import SwiftUI

struct TabBarItems: View {
    
    @Binding var currentTab: Tab
    
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            currentTab = tab
                        }
                    } label: {
                        VStack(spacing: Constants.small_margin){
                            Image(tab.rawValue)
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: Constants.middle_icon_size, height: Constants.middle_icon_size)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(currentTab == tab ? .green : .gray)
                            Text(tab.tabBarItemName)
                                .foregroundColor(currentTab == tab ? .green : .gray)
                            
                        }
                    }

                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: Constants.middle_icon_size)
        .padding(.bottom,Constants.small_double_margin)
        .padding([.horizontal, .top])
        .background {
            Color.white.opacity(0.1)
                .ignoresSafeArea()
                .blur(radius: 10)
        }
    }
}

struct TabBarItems_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
