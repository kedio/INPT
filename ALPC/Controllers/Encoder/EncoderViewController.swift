//
//  EncoderViewController.swift
//  ALPC
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class EncoderViewController: UIViewController {
    // MARK: Properties

    private let _inputView: EncoderInputView
    private let _viewModel: EncoderViewModel

    // MARK: Initialization

    init(serializer: Serializer, inputView: EncoderInputView? = nil, viewModel: EncoderViewModel? = nil) {
        _inputView = inputView ?? EncoderInputView.loadFromNib()
        _viewModel = viewModel ?? EncoderViewModel(serializer: serializer)

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

extension EncoderViewController: EncoderViewDelegate {
    func encode(value: String?) {
        let (result, error) = _viewModel.encode(value: value)
        _inputView.configure(result: result, error: error, delegate: self)
    }
}
