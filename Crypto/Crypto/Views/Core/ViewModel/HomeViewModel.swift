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
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value", percentageChange: -1),
        StatisticModel(title: "Title", value: "Value", percentageChange: 10),
        StatisticModel(title: "Title", value: "Value", percentageChange: -7)
    ]
    @Published var portfolioCoins: [CoinModel] = []
    private var coinDataService = CoinDataService()
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

