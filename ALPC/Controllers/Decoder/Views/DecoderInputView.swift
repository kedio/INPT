//
//  DecoderView.swift
//  ALPC
//
//  Created by Kevin Dion on 2018-01-16.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol DecoderViewDelegate: class {
    func decode(hiByte: String?, loByte: String?)
}

class DecoderInputView: UIView {
    // MARK: Properties

    private weak var _delegate: DecoderViewDelegate?

    // MARK: Outlets
    
    @IBOutlet weak var hiByteTextField: UITextField!
    @IBOutlet weak var loByteTextField: UITextField!
    @IBOutlet weak var decodeButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!

    @IBAction func decode(_ sender: Any) {
        _delegate?.decode(hiByte: hiByteTextField.text, loByte: loByteTextField.text)
    }

    // MARK: View lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        designView()
    }

    // MARK: Design

    private func designView() {
        designDecodeButton()
        designTextFields()
    }

    private func designDecodeButton() {
        decodeButton.layer.cornerRadius = 5
        decodeButton.layer.borderColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1).cgColor
        decodeButton.layer.borderWidth = 1
    }

    private func designTextFields() {
        hiByteTextField.delegate = self
        loByteTextField.delegate = self
    }

    // MARK: Configuration

    func configure(result: String? = nil, error: String? = nil, delegate: DecoderViewDelegate) {
        resultLabel.isHidden = result == nil
        resultLabel.text = result
        errorLabel.isHidden = error == nil
        errorLabel.text = error
        _delegate = delegate
    }
}

extension DecoderInputView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
