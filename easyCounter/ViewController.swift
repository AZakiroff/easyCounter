//
//  ViewController.swift
//  easyCounter
//
//  Created by Антон Закиров on 26.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let buttonsСhangeBackgroundColor: UIColor = .white
    private let buttonsСhangeSize: CGFloat = 80
    private let buttonsRefreshSize: CGFloat = 40
    private let buttonsСhangeBorderWidth: Double = 5.0
    private let buttonsRefreshBorderWidth: Double = 3.0
    private let buttonChangeMinusColor: UIColor = .red
    private let buttonChangePlusColor: UIColor = .blue
    private let buttonChangeRefreshColor: UIColor = .orange
    private let buttonNonActiveColor: UIColor = .gray
    private let buttonChangeMinusImageSystemName: String = "minus"
    private let buttonChangePlusImageSystemName: String = "plus"
    private let buttonChangeRefreshImageSystemName: String = "arrow.clockwise"
    private let labelFontSizeCaption: CGFloat = 16
    private let labelFontSizeCountValue: CGFloat = 52
    private let countLabelDescriptionText: String = "Значение счётчика"
    private let historyLabelDescriptionText: String = "История изменений"
    
    private let screen = UIScreen.main.bounds
    
    @IBOutlet weak private var buttonMinus: UIButton!
    @IBOutlet weak private var buttonPlus: UIButton!
    @IBOutlet weak private var buttonRefresh: UIButton!
    @IBOutlet weak private var countLabelDescription: UILabel!
    @IBOutlet weak private var countLabel: UILabel!
    @IBOutlet weak private var historyLabelDescription: UILabel!
    @IBOutlet weak private var historyTextView: UITextView!
    
    private var countValue: Int = 0 {
        didSet{
            countLabel.text = "\(countValue)"
            if countValue == 0 {
                buttonMinus.setRoundButton(color: buttonNonActiveColor)
                buttonRefresh.setRoundButton(color: buttonNonActiveColor)
            } else {
                buttonMinus.setRoundButton(color: buttonChangeMinusColor)
                buttonRefresh.setRoundButton(color: buttonChangeRefreshColor)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTextView.isEditable = false
        
        countLabelDescription.setLabel(fontSize: labelFontSizeCaption, initialText: countLabelDescriptionText, screenWidth: screen.width)
        
        historyLabelDescription.setLabel(fontSize: labelFontSizeCaption, initialText: historyLabelDescriptionText, screenWidth: screen.width)
        
        countLabel.setLabel(fontSize: labelFontSizeCountValue, initialText: "\(countValue)", screenWidth: screen.width)
        
        buttonMinus.setRoundButton(backgroundColor: buttonsСhangeBackgroundColor, size: buttonsСhangeSize, borderWidth: buttonsСhangeBorderWidth, color: buttonNonActiveColor, imageSystemName: buttonChangeMinusImageSystemName)
        
        buttonPlus.setRoundButton(backgroundColor: buttonsСhangeBackgroundColor, size: buttonsСhangeSize, borderWidth: buttonsСhangeBorderWidth, color: buttonChangePlusColor, imageSystemName: buttonChangePlusImageSystemName)
        
        buttonRefresh.setRoundButton(backgroundColor: buttonsСhangeBackgroundColor, size: buttonsRefreshSize, borderWidth: buttonsRefreshBorderWidth, color: buttonNonActiveColor, imageSystemName: buttonChangeRefreshImageSystemName)
        
        buttonRefresh.frame.origin.x = screen.width / 2 - buttonsRefreshSize / 2
        
        buttonMinus.frame.origin.x = screen.width / 2 - buttonsСhangeSize * 2
        
        buttonPlus.frame.origin.x = screen.width / 2 + buttonsСhangeSize
        
    }
    
    private func addHistory(value: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM hh:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let date = dateFormatter.string(from: Date())
        
        if value == 0 {
            historyTextView.text = "[\(date)]: значение сброшено\n" + historyTextView.text
        } else if value > 0 {
            historyTextView.text = "[\(date)]: значение изменено на +\(value)\n" + historyTextView.text
        } else {
            historyTextView.text = "[\(date)]: значение изменено на \(value)\n" + historyTextView.text
        }
    }
    
    @IBAction private func actionPushPlus(_ sender: Any) {
        countValue += 1
        addHistory(value: +1)
    }
    
    @IBAction private func actionPushMinus(_ sender: Any) {
        if countValue > 0 {
            countValue -= 1
            addHistory(value: -1)
        } else {
            countValue = 0
        }
    }
    
    @IBAction private func actionRefresh(_ sender: Any) {
        if countValue > 0 {
            countValue = 0
            addHistory(value: 0)
        }
    }

}
