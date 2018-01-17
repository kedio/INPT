//
//  DecoderViewModelTests.swift
//  ALPCTests
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import XCTest
@testable import ALPC

class DecoderViewModelTests: XCTestCase {
    // MARK: Constants

    let A_VALID_HEX = "ff"
    let EXPECTED_INTEGER_FOR_VALID_HEX = 255
    let MORE_THAN_A_BYTE = "fff"
    let AN_INVALID_VALUE = "T3"

    // MARK: Properties

    var mockSerializer: MockSerializer!
    var viewModel: DecoderViewModel!

    // MARK: SetUp

    override func setUp() {
        mockSerializer = MockSerializer()
        viewModel = DecoderViewModel(serializer: mockSerializer)
    }

    // MARK: Tests

    func test_WhenDecoding_ThenCallsSerializerWithExpectedInteger() {
        // When
        _ = viewModel.decode(hiByte: A_VALID_HEX, loByte: A_VALID_HEX)

        // Then
        XCTAssertEqual(mockSerializer.hiInDecode, EXPECTED_INTEGER_FOR_VALID_HEX)
        XCTAssertEqual(mockSerializer.loInDecode, EXPECTED_INTEGER_FOR_VALID_HEX)
    }

    func test_WhenDecodingMoreThanAByte_ThenReturnsAnError() {
        // When
        let (_, error) = viewModel.decode(hiByte: MORE_THAN_A_BYTE, loByte: MORE_THAN_A_BYTE)

        // Then
        XCTAssertNotNil(error)
    }

    func test_WhenDecodingInvalidValues_ThenReturnsAnError() {
        // When
        let (_, error) = viewModel.decode(hiByte: AN_INVALID_VALUE, loByte: AN_INVALID_VALUE)

        // Then
        XCTAssertNotNil(error)
    }

}

extension DecoderViewModelTests {
    class MockSerializer: Serializer {
        var hiInDecode: Int?
        var loInDecode: Int?

        func encode(value: Int) -> String {
            return ""
        }

        func decode(hi: Int, lo: Int) -> Int {
            hiInDecode = hi
            loInDecode = lo
            return 0
        }
    }
}
