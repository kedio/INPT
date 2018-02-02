//
//  UIViewExtensions.swift
//  INPT
//
//  Created by Kevin Dion on 2018-01-17.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

public protocol NibLoadable {}
extension UIView : NibLoadable {}

extension NibLoadable where Self: UIView {
    public static func loadFromNib() -> Self {
        let nibName = "\(self)".split{$0 == "."}.map(String.init).last!
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
}
