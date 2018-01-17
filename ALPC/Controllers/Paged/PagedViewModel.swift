//
//  PagedViewModel.swift
//  ALPC
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class PagedViewModel {
    // MARK: Properties
    
    private let _viewControllers: [UIViewController]

    var count: Int {
        return _viewControllers.count
    }

    var first: UIViewController {
        return _viewControllers.first ?? UIViewController()
    }

    // MARK: Initialization

    init(viewControllers: [UIViewController]) {
        for (index, viewController) in viewControllers.enumerated() {
            viewController.view.tag = index
        }
        _viewControllers = viewControllers
    }

    // MARK: Actions

    func getViewController(after viewController: UIViewController) -> UIViewController? {
        let index = viewController.view.tag + 1

        guard index < _viewControllers.count else { return nil }

        return _viewControllers[index]
    }

    func getViewController(before viewController: UIViewController) -> UIViewController? {
        let index = viewController.view.tag - 1

        guard index >= 0 else { return nil }

        return _viewControllers[index]
    }
}
