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
    
    @IBOutlet weak private var minusUIButton: UIButton!
    @IBOutlet weak private var plusUIButton: UIButton!
    @IBOutlet weak private var refreshUIButton: UIButton!
    @IBOutlet weak private var countDescriptionUILabel: UILabel!
    @IBOutlet weak private var countUILabel: UILabel!
    @IBOutlet weak private var historyDescriptionUILabel: UILabel!
    @IBOutlet weak private var historyTextUITextView: UITextView!
    
    private var countValue: Int = 0 {
        didSet{
            countUILabel.text = "\(countValue)"
            if countValue == 0 {
                minusUIButton.setRoundButton(color: buttonNonActiveColor)
                refreshUIButton.setRoundButton(color: buttonNonActiveColor)
            } else {
                minusUIButton.setRoundButton(color: buttonChangeMinusColor)
                refreshUIButton.setRoundButton(color: buttonChangeRefreshColor)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTextUITextView.isEditable = false
        
        countDescriptionUILabel.setLabel(fontSize: labelFontSizeCaption, initialText: countLabelDescriptionText, screenWidth: screen.width)
        
        historyDescriptionUILabel.setLabel(fontSize: labelFontSizeCaption, initialText: historyLabelDescriptionText, screenWidth: screen.width)
        
        countUILabel.setLabel(fontSize: labelFontSizeCountValue, initialText: "\(countValue)", screenWidth: screen.width)
        
        minusUIButton.setRoundButton(backgroundColor: buttonsСhangeBackgroundColor, size: buttonsСhangeSize, borderWidth: buttonsСhangeBorderWidth, color: buttonNonActiveColor, imageSystemName: buttonChangeMinusImageSystemName)
        
        plusUIButton.setRoundButton(backgroundColor: buttonsСhangeBackgroundColor, size: buttonsСhangeSize, borderWidth: buttonsСhangeBorderWidth, color: buttonChangePlusColor, imageSystemName: buttonChangePlusImageSystemName)
        
        refreshUIButton.setRoundButton(backgroundColor: buttonsСhangeBackgroundColor, size: buttonsRefreshSize, borderWidth: buttonsRefreshBorderWidth, color: buttonNonActiveColor, imageSystemName: buttonChangeRefreshImageSystemName)
        
        refreshUIButton.frame.origin.x = screen.width / 2 - buttonsRefreshSize / 2
        
        minusUIButton.frame.origin.x = screen.width / 2 - buttonsСhangeSize * 2
        
        plusUIButton.frame.origin.x = screen.width / 2 + buttonsСhangeSize
        
    }
    
    private func addHistory(value: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM hh:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let date = dateFormatter.string(from: Date())
        
        if value == 0 {
            historyTextUITextView.text = "[\(date)]: значение сброшено\n" + historyTextUITextView.text
        } else if value > 0 {
            historyTextUITextView.text = "[\(date)]: значение изменено на +\(value)\n" + historyTextUITextView.text
        } else {
            historyTextUITextView.text = "[\(date)]: значение изменено на \(value)\n" + historyTextUITextView.text
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
