//
//  ViewController.swift
//  easyCounter
//
//  Created by Антон Закиров on 26.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let buttonsСhangeBackgroundColor: UIColor = .white
    let buttonsСhangeSize: CGFloat = 80
    let buttonsRefreshSize: CGFloat = 40
    let buttonsСhangeBorderWidth: Double = 5.0
    let buttonsRefreshBorderWidth: Double = 3.0
    let buttonChangeMinusColor: UIColor = .red
    let buttonChangePlusColor: UIColor = .blue
    let buttonChangeRefreshColor: UIColor = .orange
    let buttonNonActiveColor: UIColor = .gray
    let buttonChangeMinusImageSystemName: String = "minus"
    let buttonChangePlusImageSystemName: String = "plus"
    let buttonChangeRefreshImageSystemName: String = "arrow.clockwise"
    let labelFontSizeCaption: CGFloat = 16
    let labelFontSizeCountValue: CGFloat = 52
    let countLabelDescriptionText: String = "Значение счётчика"
    let historyLabelDescriptionText: String = "История изменений"
    
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonRefresh: UIButton!
    @IBOutlet weak var countLabelDescription: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var historyLabelDescription: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    var countValue: Int = 0 {
        didSet{
            countLabel.text = "\(countValue)"
            if countValue == 0 {
                buttonMinus = setRoundButton(button: buttonMinus, color: buttonNonActiveColor)
                buttonRefresh = setRoundButton(button: buttonRefresh, color: buttonNonActiveColor)
            } else {
                buttonMinus = setRoundButton(button: buttonMinus, color: buttonChangeMinusColor)
                buttonRefresh = setRoundButton(button: buttonRefresh, color: buttonChangeRefreshColor)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTextView.isEditable = false
        
        countLabelDescription = setLabel(label: countLabelDescription, fontSize: labelFontSizeCaption, initialText: countLabelDescriptionText)
        
        historyLabelDescription = setLabel(label: historyLabelDescription, fontSize: labelFontSizeCaption, initialText: historyLabelDescriptionText)
        
        countLabel = setLabel(label: countLabel, fontSize: labelFontSizeCountValue, initialText: "\(countValue)")
        
        buttonMinus = setRoundButton(button: buttonMinus, backgroundColor: buttonsСhangeBackgroundColor, size: buttonsСhangeSize, borderWidth: buttonsСhangeBorderWidth, color: buttonNonActiveColor, imageSystemName: buttonChangeMinusImageSystemName)
        
        buttonPlus = setRoundButton(button: buttonPlus, backgroundColor: buttonsСhangeBackgroundColor, size: buttonsСhangeSize, borderWidth: buttonsСhangeBorderWidth, color: buttonChangePlusColor, imageSystemName: buttonChangePlusImageSystemName)
        
        buttonRefresh = setRoundButton(button: buttonRefresh, backgroundColor: buttonsСhangeBackgroundColor, size: buttonsRefreshSize, borderWidth: buttonsRefreshBorderWidth, color: buttonNonActiveColor, imageSystemName: buttonChangeRefreshImageSystemName)
        
    }
    
    @IBAction func actionPushPlus(_ sender: Any) {
        countValue += 1
        addHistory(value: +1)
    }
    
    @IBAction func actionPushMinus(_ sender: Any) {
        if countValue > 0 {
            countValue -= 1
            addHistory(value: -1)
        } else {
            countValue = 0
        }
    }
    
    @IBAction func actionRefresh(_ sender: Any) {
        if countValue > 0 {
            countValue = 0
            addHistory(value: 0)
        }
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
    
    private func setRoundButton(button: UIButton,
                                backgroundColor: UIColor? = nil,
                                size: CGFloat? = nil,
                                borderWidth: Double? = nil,
                                color: UIColor,
                                imageSystemName: String? = nil) -> UIButton {
        if let imageSystemName = imageSystemName {
            button.setImage(UIImage(systemName: imageSystemName), for: .normal)
        }
        if let backgroundColor = backgroundColor {
            button.backgroundColor = backgroundColor
        }
        if let size = size {
            button.frame.size.width = size
            button.frame.size.height = size
            button.layer.cornerRadius = size / 2
        }
        if let borderWidth = borderWidth {
            button.layer.borderWidth = borderWidth
        }
        button.setTitle("", for: .normal)
        button.tintColor = color
        button.layer.borderColor = (color).cgColor
        
        return button
    }
    
    private func setLabel(label: UILabel,
                          fontSize: CGFloat,
                          initialText: String) -> UILabel{
        label.font = UIFont.systemFont(ofSize: fontSize)
        //label.frame.size.width = fontSize //не знаю как правильно задать ширину))
        label.frame.size.height = fontSize
        label.text = initialText
        
        return label
    }


}

