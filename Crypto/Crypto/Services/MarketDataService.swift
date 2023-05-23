//
//  MarketDataService.swift
//  Crypto
//
//  Created by TheGIZzz on 22/5/2566 BE.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketDataModel: MarketDataModel? = nil
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketDataModel = returnedGlobalData.data
                self?.coinSubscription?.cancel()
            })
    }
}
