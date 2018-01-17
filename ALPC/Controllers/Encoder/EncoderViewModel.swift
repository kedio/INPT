//
//  EncoderViewModel.swift
//  ALPC
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

class EncoderViewModel {
    // MARK: Properties

    private let _serializer: Serializer

    // MARK: Initialization

    init(serializer: Serializer) {
        _serializer = serializer
    }

    // MARK: Methodes
    
    func encode(value: String?) -> (result: String?, error: String?) {
        guard let value = value else { return (nil, "Value should not be empty")}
        guard let integerValue = Int(value) else { return (nil, "Invalid number")}
        guard integerValue >= -8192 && integerValue <= 8191 else { return (nil, "Out of bound")}

        let result = _serializer.encode(value: integerValue)
        return (result, nil)
    }
}
