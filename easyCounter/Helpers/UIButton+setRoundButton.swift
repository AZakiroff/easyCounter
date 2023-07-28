//
//  UIButton+setRoundButton.swift
//  easyCounter.ios
//
//  Created by Антон Закиров on 27.07.2023.
//

import UIKit

extension UIButton {
    public func setRoundButton(backgroundColor: UIColor? = nil,
                                size: CGFloat? = nil,
                                borderWidth: Double? = nil,
                                color: UIColor,
                                imageSystemName: String? = nil) {
        if let imageSystemName = imageSystemName {
           self.setImage(UIImage(systemName: imageSystemName), for: .normal)
        }
        
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
        
        if let size = size {
            self.frame.size.width = size
            self.frame.size.height = size
            self.layer.cornerRadius = size / 2
        }
        
        if let borderWidth = borderWidth {
            self.layer.borderWidth = borderWidth
        }
        
        self.setTitle("", for: .normal)
        self.tintColor = color
        self.layer.borderColor = (color).cgColor
    }
}
