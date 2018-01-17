//
//  DecoderViewModel.swift
//  ALPC
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

class DecoderViewModel {
    // MARK: Properties

    private let _serializer: Serializer

    // MARK: Initialization

    init(serializer: Serializer) {
        _serializer = serializer
    }

    // MARK: Methodes
    
    func decode(hiByte: String?, loByte: String?) -> (result: String?, error: String?) {
        guard let hiByte = hiByte, let loByte = loByte else { return (nil, "Bytes should not be empty") }
        guard hiByte.count <= 2 && loByte.count <= 2 else { return (nil, "Values should not be longuer than a byte.") }
        guard let hi = Int(hiByte, radix: 16), let lo = Int(loByte, radix: 16) else { return (nil, "Invalid HEX value")}

        let result = _serializer.decode(hi: hi, lo: lo)
        return ("\(result)", nil)
    }
}
