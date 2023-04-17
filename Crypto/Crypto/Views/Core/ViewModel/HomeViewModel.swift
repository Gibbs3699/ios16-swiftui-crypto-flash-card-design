//
//  HomeViewModel.swift
//  Crypto
//
//  Created by TheGIZzz on 4/4/2566 BE.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    
    private var coinDataService = CoinDataService()
    
    @Published var portfolioCoins: [CoinModel] = []
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    private func addSubscriber() {
        coinDataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                guard let self = self else { return }
                self.allCoins = returnedCoins
            }
            .store(in: &cancellable)
    }
}

