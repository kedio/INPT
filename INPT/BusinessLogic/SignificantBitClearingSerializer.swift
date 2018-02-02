//
//  SignificantBitClearingSecondStrategySerializer.swift
//  INPT
//
//  Created by Kevin Dion on 2018-01-18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

class SignificantBitClearingSerializer: Serializer {
    // MARK: Constants

    let MAX_ABSOLUTE_VALUE = 8192
    let BYTE_LENGHT = 8
    let ENCODING_LO_MASK = 127 // 00000000 01111111
    let DECODING_LO_SIGNIFICANT_BIT_MASK = 1 // 00000001

    // MARK: Methods

    func encode(value: Int) -> String {
        let unsignedValue = value + MAX_ABSOLUTE_VALUE
        let encodedHi = unsignedValue >> (BYTE_LENGHT - 1)
        let encodedLo = unsignedValue & ENCODING_LO_MASK

        return formatToHex(byte: encodedHi) + formatToHex(byte: encodedLo)
    }

    private func formatToHex(byte: Int) -> String {
        let string = String(byte, radix: 16, uppercase: true)

        return String(repeating: "0", count: 2 - string.count) + string
    }

    func decode(hi: Int, lo: Int) -> Int {
        let decodedHi = (hi >> 1) << BYTE_LENGHT
        let decodedLoSignificantBit = (hi & DECODING_LO_SIGNIFICANT_BIT_MASK) << (BYTE_LENGHT - 1)
        let unsignedValue = decodedHi | decodedLoSignificantBit | lo

        return unsignedValue - MAX_ABSOLUTE_VALUE
    }
}
