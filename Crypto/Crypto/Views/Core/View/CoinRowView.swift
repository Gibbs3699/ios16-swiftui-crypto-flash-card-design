//
//  CoinRowView.swift
//  Crypto
//
//  Created by TheGIZzz on 30/3/2566 BE.
//

import Foundation
import SwiftUI

struct CoinRowView: View {
    
    let showCurrentHolding: Bool
    let coin: CoinModel
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text((coin.symbol.uppercased()))
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
            
            Spacer()
            
            if showCurrentHolding {
                VStack(alignment: .trailing) {
                    Text(coin.currentHoldingValue.asCurrencyWith6Decimals())
                        .bold()
                    Text((coin.currentHoldings ?? 0).asNumberString())
                }
            }
            
            VStack(alignment: .trailing) {
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundColor(Color.theme.accent)
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "0.00%")
                    .bold()
                    .foregroundColor(coin.priceChangePercentage24H ?? 0.00 >= 0 ? Color.theme.green : Color.theme.red)
            }
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(showCurrentHolding: true, coin: dev.coin)
    }
}
