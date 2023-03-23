//
//  CardViewModel.swift
//  Crypto
//
//  Created by TheGIZzz on 23/3/2566 BE.
//

import Foundation
import Combine

class CardViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    
    private var coinDataService = CoinDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        coinDataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                guard let self = self else { return }
                self.allCoins = returnedCoins
            }
            .store(in: &cancellables)

    }
}
