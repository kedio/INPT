//
//  PagedViewController.swift
//  ALPC
//
//  Created by Kevin Dion on 2018-01-16.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class PagedViewController: UIPageViewController {
    // MARK: Properties

    private let _viewControllers: [UIViewController]

    // MARK: Initialization

    init(viewControllers: [UIViewController]) {
        for (index, viewController) in viewControllers.enumerated() {
            viewController.view.tag = index
        }
        _viewControllers = viewControllers

        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        dataSource = self

        guard let firstViewController = viewControllers.first else { return }

        setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        designView()
    }

    // MARK: Design

    private func designView() {
        view.backgroundColor = .white
    }
}

extension PagedViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = viewController.view.tag + 1

        guard index < _viewControllers.count else { return nil }

        return _viewControllers[index]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = viewController.view.tag - 1

        guard index > 0 else { return nil }

        return _viewControllers[index]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return _viewControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
