//
//  HomeView.swift
//  Crypto
//
//  Created by TheGIZzz on 26/3/2566 BE.
//

import SwiftUI
import RiveRuntime

struct HomeView: View {
    
    let card = RiveViewModel(fileName: "card-slider", autoPlay: false)
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    @State private var showPortfolioView: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(vm)
                })
            
            VStack {
                homeView
                
                Spacer(minLength: 0)
                
                cardSlide
                    .overlay(
                        StatisticCardView(showPortfolio: $showPortfolio)
                    )
                    .onTapGesture {
                        if showPortfolio {
                            card.play(animationName: "right")
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.spring()) {
                                    showPortfolio.toggle()
                                }
                            }
                        } else {
                            card.play(animationName: "left")
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.spring()) {
                                    showPortfolio.toggle()
                                }
                            }
                        }
                    }
                    .padding(.top, -20)
                
                SearchBarView(searchText: $vm.searchText)
                    .padding(.top, -20)
                
                columnTitles
                
                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                
                if showPortfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
        }
    }
    
    var cardSlide: some View {
        ZStack {
            card.view()
                .frame(width: UIScreen.main.bounds.width, height: 150, alignment: .center)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
    
}

extension HomeView {
    
    var homeView: some View {
        HStack {
            HStack(spacing: 0) {
                if showPortfolio {
                    LottieView(lottieFile: "add", loopMode: .loop)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text(showPortfolio ? "Portfolio".uppercased() : "Live Prices".uppercased())
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.theme.accent)
                                .animation(.none, value: 0)
                                .frame(width: 100, alignment: .leading)
                                .offset(x: 90)
                        )
                } else {
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
            }
            .frame(width: 120, height: 120)
                
            Spacer()
            
            HStack(spacing: 0) {
                LottieView(lottieFile: "dancing-burger", loopMode: .loop)
                    .frame(width: 100, height: 100)
                CircleButtonView(iconName: "chevron.right")
                    .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                    .onTapGesture {
                        if showPortfolio {
                            card.play(animationName: "right")
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.spring()) {
                                    showPortfolio.toggle()
                                }
                            }
                        } else {
                            card.play(animationName: "left")
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.spring()) {
                                    showPortfolio.toggle()
                                }
                            }
                        }
                }
            }
        }
        .padding(.trailing, 10)
    }
    
    var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(showCurrentHolding: false, coin: coin)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    var portfolioCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(showCurrentHolding: true, coin: coin)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            
            Spacer()
            
            if showPortfolio {
                Text("Holdings")
            }
            
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 2.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
