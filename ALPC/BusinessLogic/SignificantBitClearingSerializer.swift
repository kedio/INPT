//
//  SignificantBitClearingSerializer.swift
//  ALPC
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

class SignificantBitClearingSerializer: Serializer {
    func encode(value: Int) -> String {
        return "Encoded"
    }

    func decode(hi: Int, lo: Int) -> Int {
        return 0
    }
}
