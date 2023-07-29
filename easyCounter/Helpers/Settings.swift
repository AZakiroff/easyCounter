//
//  settings.swift
//  easyCounter.ios
//
//  Created by Антон Закиров on 29.07.2023.
//

import UIKit

enum Settings {
    static let buttonsСhangeBackgroundColor: UIColor = .white
    static let buttonsСhangeSize: CGFloat = 80
    static let buttonsRefreshSize: CGFloat = 40
    static let buttonsСhangeBorderWidth: Double = 5.0
    static let buttonsRefreshBorderWidth: Double = 3.0
    static let buttonChangeMinusColor: UIColor = .red
    static let buttonChangePlusColor: UIColor = .blue
    static let buttonChangeRefreshColor: UIColor = .orange
    static let buttonNonActiveColor: UIColor = .gray
    static let buttonChangeMinusImageSystemName: String = "minus"
    static let buttonChangePlusImageSystemName: String = "plus"
    static let buttonChangeRefreshImageSystemName: String = "arrow.clockwise"
    static let labelFontSizeCaption: CGFloat = 16
    static let labelFontSizeCountValue: CGFloat = 52
    static let countLabelDescriptionText: String = "Значение счётчика"
    static let historyLabelDescriptionText: String = "История изменений"
}
