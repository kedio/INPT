//
//  PagedViewModelTests.swift
//  INPTTests
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import XCTest
@testable import INPT

class PagedViewModelTests: XCTestCase {
    // MARK: Properties

    var first: UIViewController!
    var last: UIViewController!
    var viewModel: PagedViewModel!

    // MARK: SetUp
    override func setUp() {
        first = UIViewController()
        last = UIViewController()
        viewModel = PagedViewModel(viewControllers: [first, last])
    }

    // MARK: Tests

    func test_WhenGettingCount_ThenReturnsExpectedCount() {
        // When
        let actual = viewModel.count
        // Then
        XCTAssertEqual(actual, 2)
    }

    func test_WhenGettingFirst_ThenReturnsExpectedViewController() {
        // When
        let actual = viewModel.first
        // Then
        XCTAssertEqual(actual, first)
    }

    func test_WhenGettingViewControllerAfterFirst_ThenReturnsExpectedViewController() {
        // When
        let actual = viewModel.getViewController(after: first)
        // Then
        XCTAssertEqual(actual, last)
    }

    func test_WhenGettingViewControllerAfterLast_ThenReturnsExpectedViewController() {
        // When
        let actual = viewModel.getViewController(after: last)
        // Then
        XCTAssertNil(actual)
    }

    func test_WhenGettingViewControllerBeforeLast_ThenReturnsExpectedViewController() {
        // When
        let actual = viewModel.getViewController(before: last)
        // Then
        XCTAssertEqual(actual, first)
    }

    func test_WhenGettingViewControllerBeforeFirst_ThenReturnsNil() {
        // When
        let actual = viewModel.getViewController(before: first)
        // Then
        XCTAssertNil(actual)
    }
}
