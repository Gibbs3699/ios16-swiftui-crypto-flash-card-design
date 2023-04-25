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
            leftColumn
            
            Spacer()

            if showCurrentHolding {
                centerColumn
            }
            
            rightColumn
        }
    }
}

extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            .frame(minWidth: 30)
            
            CoinImageView(coin: coin)
                .frame(width: 40, height: 40)
            
            Text((coin.symbol.uppercased()))
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingValue.asCurrencyWith6Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
            .foregroundColor(Color.theme.accent)
            
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "0.00%")
                .bold()
                .foregroundColor(coin.priceChangePercentage24H ?? 0.00 >= 0 ? Color.theme.green : Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 2.5, alignment: .trailing)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(showCurrentHolding: true, coin: dev.coin)
    }
}
