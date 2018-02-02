//
//  DecoderViewControllerTests.swift
//  INPTTests
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import XCTest
@testable import INPT

class DecoderViewControllerTests: XCTestCase {
    // MARK: Properties

    var mockInputView: MockDecoderInputView!
    var mockViewModel: MockDecoderViewModel!
    var controller: DecoderViewController!

    // MARK: SetUp

    override func setUp() {
        mockInputView = MockDecoderInputView()
        mockViewModel = MockDecoderViewModel()
        controller = DecoderViewController(serializer: MockSerializer(), inputView: mockInputView, viewModel: mockViewModel)
    }

    // MARK: Tests

    func test_WhenDecodeIsTiggered_ThenViewModelIsCalled() {
        // When
        controller.decode(hiByte: "", loByte: "")

        // Then
        XCTAssertTrue(mockViewModel.decodeCalled)
    }

    func test_WhenDecodeIsTiggered_ThenViewIsConfigured() {
        // When
        controller.decode(hiByte: "", loByte: "")

        // Then
        XCTAssertTrue(mockViewModel.decodeCalled)
    }
}

extension DecoderViewControllerTests {
    class MockDecoderInputView: DecoderInputView {
        var configureCalled = false

        override func configure(result: String?, error: String?, delegate: DecoderViewDelegate) {
            configureCalled = true
        }
    }

    class MockDecoderViewModel: DecoderViewModel {
        var decodeCalled = false

        init() {
            super.init(serializer: MockSerializer())
        }

        override func decode(hiByte: String?, loByte: String?) -> (result: String?, error: String?) {
            decodeCalled = true
            return ("", nil)
        }
    }

    class MockSerializer: Serializer {
        func encode(value: Int) -> String {
            return ""
        }

        func decode(hi: Int, lo: Int) -> Int {
            return 0
        }
    }
}
