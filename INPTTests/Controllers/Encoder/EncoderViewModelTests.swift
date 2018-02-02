//
//  EncoderViewModelTests.swift
//  INPTTests
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import XCTest
@testable import INPT

class EncoderViewModelTests: XCTestCase {
    // MARK: Constants

    let A_VALID_VALUE = -1
    let OUT_OF_HIGH_BOUND_VALUE = 8192
    let OUT_OF_LOW_BOUND_VALUE = -8193
    let AN_INVALID_VALUE = "ab23"

    // MARK: Properties

    var mockSerializer: MockSerializer!
    var viewModel: EncoderViewModel!

    // MARK: SetUp

    override func setUp() {
        mockSerializer = MockSerializer()
        viewModel = EncoderViewModel(serializer: mockSerializer)
    }

    // MARK: Tests

    func test_WhenEncodingValue_ThenCallSerializerWithExpectedInteger() {
        // When
        _ = viewModel.encode(value: "\(A_VALID_VALUE)")

        // Then
        XCTAssertEqual(mockSerializer.valueInEncode, A_VALID_VALUE)
    }

    func test_WhenEncodingValueOutOfHighBound_ThenReturnsAnError() {
        // When
        let (_, error) = viewModel.encode(value: "\(OUT_OF_HIGH_BOUND_VALUE)")

        // Then
        XCTAssertNotNil(error)
    }

    func test_WhenEncodingValueOutOfLowBound_ThenReturnsAnError() {
        // When
        let (_, error) = viewModel.encode(value: "\(OUT_OF_LOW_BOUND_VALUE)")

        // Then
        XCTAssertNotNil(error)
    }

    func test_WhenEncodingValueContainingCharacter_ThenReturnsAnError() {
        // When
        let (_, error) = viewModel.encode(value: AN_INVALID_VALUE)

        // Then
        XCTAssertNotNil(error)
    }
}

extension EncoderViewModelTests {
    class MockSerializer: Serializer {
        var valueInEncode: Int?

        func encode(value: Int) -> String {
            valueInEncode = value
            return ""
        }

        func decode(hi: Int, lo: Int) -> Int {
            return 0
        }
    }
}
