//
//  StatisticCardView.swift
//  Crypto
//
//  Created by TheGIZzz on 28/4/2566 BE.
//

import SwiftUI

struct StatisticCardView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
    
}

struct StatisticCardView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticCardView(showPortfolio: .constant(true))
            .environmentObject(dev.homeVM)
    }
}
