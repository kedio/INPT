//
//  EncodeInputView.swift
//  INPT
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol EncoderViewDelegate: class {
    func encode(value: String?)
}

class EncoderInputView: UIView {
    // MARK: Properties

    private weak var _delegate: EncoderViewDelegate?

    // MARK: Outlets

    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var encodeButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!

    @IBAction func encode(_ sender: Any) {
        _delegate?.encode(value: valueTextField.text)
    }

    // MARK: View lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        designView()
    }

    // MARK: Design

    private func designView() {
        designEncodeButton()
        designValueTextField()
    }

    private func designEncodeButton() {
        encodeButton.layer.cornerRadius = 5
        encodeButton.layer.borderColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1).cgColor
        encodeButton.layer.borderWidth = 1
    }

    private func designValueTextField() {
        valueTextField.delegate = self
    }

    // MARK: Configuration

    func configure(result: String? = nil, error: String? = nil, delegate: EncoderViewDelegate) {
        resultLabel.isHidden = result == nil
        resultLabel.text = result
        errorLabel.isHidden = error == nil
        errorLabel.text = error
        _delegate = delegate
    }
}

extension EncoderInputView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
