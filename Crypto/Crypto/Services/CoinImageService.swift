//
//  CoinImageService.swift
//  Crypto
//
//  Created by TheGIZzz on 10/4/2566 BE.
//

import Foundation
import Combine
import SwiftUI

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    var imageSubscription: AnyCancellable?
    
    init(urlString: String) {
        getCoinImage(urlString: urlString)
    }
    
    private func getCoinImage(urlString: String) {
        guard let urlString = URL(string: urlString) else { return }
        
        imageSubscription = NetworkingManager.download(url: urlString)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
