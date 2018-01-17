//
//  DecoderViewController.swift
//  ALPC
//
//  Created by Kevin Dion on 2018-01-16.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class DecoderViewController: UIViewController {
    // MARK: Properties

    private let _decoderView = DecoderInputView.loadFromNib()
    private let _viewModel: DecoderViewModel

    // MARK: Initialization

    init(viewModel: DecoderViewModel? = nil) {
        _viewModel = viewModel ?? DecoderViewModel()

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        designView()
    }

    // MARK: Design

    private func designView() {
        view.addSubview(_decoderView)
        let margins = view.layoutMarginsGuide
        _decoderView.translatesAutoresizingMaskIntoConstraints = false
        _decoderView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        _decoderView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        _decoderView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        _decoderView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true

        _decoderView.configure(delegate: self)
    }
}

extension DecoderViewController: DecoderViewDelegate {
    func encode(hiByte: String?, loByte: String?) {
        let encodedValue = _viewModel.encode(hiByte: hiByte, loByte: loByte)
        _decoderView.configure(result: encodedValue, delegate: self)
    }
}
