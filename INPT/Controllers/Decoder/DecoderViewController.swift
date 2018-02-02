//
//  DecoderViewController.swift
//  INPT
//
//  Created by Kevin Dion on 2018-01-16.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class DecoderViewController: UIViewController {
    // MARK: Properties

    private let _inputView: DecoderInputView
    private let _viewModel: DecoderViewModel

    // MARK: Initialization

    init(serializer: Serializer, inputView: DecoderInputView? = nil, viewModel: DecoderViewModel? = nil) {
        _inputView = inputView ?? DecoderInputView.loadFromNib()
        _viewModel = viewModel ?? DecoderViewModel(serializer: serializer)

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
        designInputView()
    }

    private func designInputView() {
        view.addSubview(_inputView)
        let margins = view.layoutMarginsGuide
        _inputView.translatesAutoresizingMaskIntoConstraints = false
        _inputView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        _inputView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        _inputView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        _inputView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true

        _inputView.configure(delegate: self)
    }
}

extension DecoderViewController: DecoderViewDelegate {
    func decode(hiByte: String?, loByte: String?) {
        let (result, error) = _viewModel.decode(hiByte: hiByte, loByte: loByte)
        _inputView.configure(result: result, error: error, delegate: self)
    }
}
