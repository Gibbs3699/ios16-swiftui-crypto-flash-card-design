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
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_image"
    private let imangeName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imangeName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let saveImage = fileManager.getImage(imageName: imangeName, folderName: folderName) {
            image = saveImage
            print("Retrieved image from File Manager!")
        } else {
            downloadCoinImage()
            print("Downloading Image now")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadImage = returnedImage else { return }
                self.image = downloadImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadImage, imageName: self.imangeName, folderName: self.folderName)
            })
    }
}
