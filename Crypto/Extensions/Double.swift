//
//  Double.swift
//  Crypto
//
//  Created by TheGIZzz on 29/3/2566 BE.
//

import Foundation

extension Double {
    
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumIntegerDigits = 2
        formatter.maximumIntegerDigits = 6
        return formatter
    }
}
