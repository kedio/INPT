//
//  Serializer.swift
//  ALPC
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

protocol Serializer {
    func encode(value: Int) -> String
    func decode(hi: Int, lo: Int) -> Int
}
