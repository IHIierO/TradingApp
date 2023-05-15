//
//  Preloader.swift
//  TradingApp
//
//  Created by Artem Vorobev on 14.05.2023.
//

import SwiftUI

struct Preloader: View {
    
    @State private var progress: CGFloat = 0
    @State private var isActive = false
    @State private var goToApp: Bool = false
    
    var body: some View {
        
        if isActive {
            VStack {
                Spacer()
                
                FilledButton(title: "Activate NOW", action: {
                    goToApp.toggle()
                }, color: .green, radius: Constants.btn_radius, height: Constants.button_height, fontSize: Constants.middle_text_size, alignment: .center)
                .padding(.horizontal, Constants.large_margin)
                .onAppear{
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("Разрешение получено")
                        } else if let error = error {
                            print("Notification Error: \(error.localizedDescription)")
                        }
                    }
                }
                .fullScreenCover(isPresented: $goToApp, content: CustomTabBar.init)
            }
        } else {
            HUDProgressView(progress: $progress)
                .padding(.horizontal, Constants.middle_margin)
                .onAppear{
                    startAnimating()
                    
                }
        }
    }
    
    private func startAnimating() {
        let duration = 2.0
        var timeElapsed = 0.0
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            timeElapsed += 0.1
            progress = timeElapsed / duration
            
            if timeElapsed >= duration {
                timer.invalidate()
                isActive = true
            }
        }
    }
}

struct Preloader_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
