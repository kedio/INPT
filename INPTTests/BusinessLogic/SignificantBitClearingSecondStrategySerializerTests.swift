//
//  SignificantBitClearingSerializerTests.swift
//  INPTTests
//
//  Created by Kevin Dion on 2018-01-18.
//  Copyright © 2018 None. All rights reserved.
//

import XCTest
@testable import INPT

class SignificantBitClearingSerializerTests: XCTestCase {
    // MARK: Constants

    let VALUES_TO_ENCODE = [0, -8192, 8191, 2048, -4096]
    let EXPECTED_ENCODED_VALUES = ["4000", "0000", "7F7F", "5000", "2000"]

    let VALUES_TO_DECODE = [("40", "00"), ("00", "00"), ("7F", "7F"), ("50", "00"), ("0A", "05"), ("55", "00")]
    let EXPECTED_DECODED_VALUES = [0, -8192, 8191, 2048, -6907, 2688]

    // MARK: Tests

    func test_WhenEncodingValues_ThenReturnsExpectedValues() {
        // Given
        let serializer = SignificantBitClearingSerializer()

        // When
        let actualValues = VALUES_TO_ENCODE.map { serializer.encode(value: $0) }

        // Then
        XCTAssertEqual(actualValues, EXPECTED_ENCODED_VALUES)
    }

    func test_WhenDecodingValues_ThenReturnsExpectedValues() {
        // Given
        let serializer = SignificantBitClearingSerializer()
        let valuesToEncode = VALUES_TO_DECODE.map { (hi, lo) in (Int(hi, radix: 16)!, Int(lo, radix: 16)!) }

        // When
        let actualValues = valuesToEncode.map { (hi, lo) in serializer.decode(hi: hi, lo: lo) }

        // Then
        XCTAssertEqual(actualValues, EXPECTED_DECODED_VALUES)
    }
}
