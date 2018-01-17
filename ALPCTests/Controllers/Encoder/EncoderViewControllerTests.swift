//
//  EncoderViewControllerTests.swift
//  ALPCTests
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import XCTest
@testable import ALPC

class EncoderViewControllerTests: XCTestCase {
    // MARK: Properties

    var mockInputView: MockEncoderInputView!
    var mockViewModel: MockEncoderViewModel!
    var controller: EncoderViewController!

    // MARK: SetUp

    override func setUp() {
        mockInputView = MockEncoderInputView()
        mockViewModel = MockEncoderViewModel()
        controller = EncoderViewController(serializer: MockSerializer(), inputView: mockInputView, viewModel: mockViewModel)
    }

    // MARK: Tests

    func test_WhenEncodeIsTiggered_ThenViewModelIsCalled() {
        // When
        controller.encode(value: "")

        // Then
        XCTAssertTrue(mockViewModel.encodeCalled)
    }

    func test_WhenEncodeIsTiggered_ThenViewIsConfigured() {
        // When
        controller.encode(value: "")

        // Then
        XCTAssertTrue(mockViewModel.encodeCalled)
    }
}

extension EncoderViewControllerTests {
    class MockEncoderInputView: EncoderInputView {
        var configureCalled = false

        override func configure(result: String?, error: String?, delegate: EncoderViewDelegate) {
            configureCalled = true
        }
    }

    class MockEncoderViewModel: EncoderViewModel {
        var encodeCalled = false

        init() {
            super.init(serializer: MockSerializer())
        }

        override func encode(value: String?) -> (result: String?, error: String?) {
            encodeCalled = true
            return (nil, nil)
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
