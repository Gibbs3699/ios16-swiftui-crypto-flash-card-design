//
//  UIApplication.swift
//  Crypto
//
//  Created by TheGIZzz on 25/5/2566 BE.
//

import Foundation
import SwiftUI

extension UIApplication {

    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


