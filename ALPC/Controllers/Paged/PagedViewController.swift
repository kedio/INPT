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

    private let _viewModel: PagedViewModel

    // MARK: Initialization

    init(viewControllers: [UIViewController]? = nil, viewModel: PagedViewModel? = nil) {
        _viewModel = viewModel ?? PagedViewModel(viewControllers: viewControllers ?? [])

        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
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
        dataSource = self
        setViewControllers([_viewModel.first], direction: .forward, animated: true, completion: nil)
    }
}

extension PagedViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return _viewModel.getViewController(after: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return _viewModel.getViewController(before: viewController)
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return _viewModel.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
