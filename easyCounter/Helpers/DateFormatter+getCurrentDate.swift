//
//  DateFormatter+getCurrentDate.swift
//  easyCounter.ios
//
//  Created by Антон Закиров on 29.07.2023.
//

import UIKit

extension DateFormatter {
    public func getCurrentDate() -> String {
        let dateFormatter = self
        dateFormatter.dateFormat = "d MMMM hh:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let date = dateFormatter.string(from: Date())
        
        return date
    }
}
