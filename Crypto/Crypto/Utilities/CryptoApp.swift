//
//  CryptoApp.swift
//  Crypto
//
//  Created by TheGIZzz on 18/3/2566 BE.
//

import SwiftUI

@main
struct CryptoApp: App {
    @StateObject private var vm = CardViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .navigationBarHidden(true)
            .environmentObject(vm)
        }
    }
}
