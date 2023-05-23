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
    @Published var statistics: [StatisticModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    private var coinDataService = CoinDataService()
    private var marketDataService = MarketDataService()
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
        
        marketDataService.$marketDataModel
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                guard let self = self else { return }
                self.statistics = returnedStats
            }
            .store(in: &cancellable)
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volumn = StatisticModel(title: "24h Volumn", value: data.volumn)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
            marketCap,
            volumn,
            btcDominance,
            portfolio
        ])
    
        return stats
    }
}

