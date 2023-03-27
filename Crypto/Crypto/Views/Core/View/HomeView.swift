//
//  HomeView.swift
//  Crypto
//
//  Created by TheGIZzz on 26/3/2566 BE.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                homeView
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .navigationBarHidden(true)
    }
}

extension HomeView {
    
    var homeView: some View {
        HStack {
            HStack(spacing: 0) {
                LottieView(lottieFile: "coin", loopMode: .loop)
                    .frame(width: 120, height: 120)
                    .overlay(
                        Text(showPortfolio ? "Portfolio".uppercased() : "Live Prices".uppercased())
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.theme.accent)
                            .animation(.none, value: 0)
                            .frame(width: 100, alignment: .leading)
                            .offset(x: 90)
                    )
            }
                
            Spacer()
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.trailing, 10)
    }
}
