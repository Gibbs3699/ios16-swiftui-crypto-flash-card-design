//
//  CardView.swift
//  Crypto
//
//  Created by TheGIZzz on 19/3/2566 BE.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    @EnvironmentObject private var vm: CardViewModel
    
    let id = UUID()
//    let coin: CoinModel
    
    var body: some View {
        ForEach(vm.allCoins) { coin in
            Image(coin.image)
                .resizable()
                .cornerRadius(30)
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
                .overlay(
                    VStack(alignment: .center, spacing: 12) {
                        Text(coin.name.uppercased())
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .shadow(radius: 1)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 4)
                            .overlay(
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(height: 1),
                                alignment: .bottom
                            )
                        Text(coin.symbol.uppercased())
                            .foregroundColor(.black)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .frame(minWidth: 85)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                Capsule().fill(Color.white)
                            )
                    }
                    .frame(minWidth: 280)
                    .padding(.bottom, 50),
                    alignment: .bottom
                )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardView()
                .previewLayout(.sizeThatFits)
        }
        .environmentObject(dev.cardVM)
    }
}

