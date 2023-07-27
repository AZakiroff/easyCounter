//
//  UILabel+setLabel.swift
//  easyCounter.ios
//
//  Created by Антон Закиров on 27.07.2023.
//

import UIKit

extension UILabel {
    public func setLabel(fontSize: CGFloat,
                         initialText: String,
                         screenWidth: CGFloat) {
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.frame.size.width = screenWidth - 20
        self.frame.origin.x = 10
        self.frame.size.height = fontSize
        self.text = initialText
    }
}
