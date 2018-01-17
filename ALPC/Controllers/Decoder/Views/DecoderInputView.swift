//
//  DecoderView.swift
//  ALPC
//
//  Created by Kevin Dion on 2018-01-16.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol DecoderViewDelegate: class {
    func encode(hiByte: String?, loByte: String?)
}

class DecoderInputView: UIView {
    // MARK: Properties

    private weak var _delegate: DecoderViewDelegate?

    // MARK: Outlets
    
    @IBOutlet weak var hiByteTextView: UITextField!
    @IBOutlet weak var loByteTextView: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func encode(_ sender: Any) {
        _delegate?.encode(hiByte: hiByteTextView.text, loByte: loByteTextView.text)
    }

    // MARK: Configuration

    func configure(result: String? = nil, delegate: DecoderViewDelegate) {
        resultLabel.text = result
        _delegate = delegate
    }
}
