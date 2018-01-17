//
//  PagedViewControllerTests.swift
//  ALPCTests
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import XCTest
@testable import ALPC

class PagedViewControllerTests: XCTestCase {
    // MARK: Properties

    var mockViewModel: MockPagedViewModel!
    var controller: PagedViewController!

    // MARK: SetUp

    override func setUp() {
        mockViewModel = MockPagedViewModel()
        controller = PagedViewController(viewModel: mockViewModel)
    }

    // MARK: Tests

    func test_WhenRequestingViewControllerAfter_ThenViewModelIsCalled() {
        // When
        _ = controller.pageViewController(controller, viewControllerAfter: UIViewController())

        // Then
        XCTAssertTrue(mockViewModel.viewControllerAfterCalled)
    }

    func test_WhenRequestingViewControllerBefore_ThenViewModelIsCalled() {
        // When
        _ = controller.pageViewController(controller, viewControllerBefore: UIViewController())

        // Then
        XCTAssertTrue(mockViewModel.viewControllerBeforeCalled)
    }
}

extension PagedViewControllerTests {
    class MockPagedViewModel: PagedViewModel {
        var viewControllerAfterCalled = false
        var viewControllerBeforeCalled = false

        init() {
            super.init(viewControllers: [])
        }

        override func getViewController(after viewController: UIViewController) -> UIViewController? {
            viewControllerAfterCalled = true
            return nil
        }

        override func getViewController(before viewController: UIViewController) -> UIViewController? {
            viewControllerBeforeCalled = true
            return nil
        }
    }
}
