//
//  StatisticCardViewModel.swift
//  Crypto
//
//  Created by TheGIZzz on 5/5/2566 BE.
//

import Foundation
import Combine

class StatisticCardViewModel: ObservableObject {
    
    @Published var coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
    }
}
