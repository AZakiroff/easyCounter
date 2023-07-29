//
//  ViewController.swift
//  easyCounter
//
//  Created by Антон Закиров on 26.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
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
                minusUIButton.setRoundButton(color: Settings.buttonNonActiveColor)
                refreshUIButton.setRoundButton(color: Settings.buttonNonActiveColor)
            } else {
                minusUIButton.setRoundButton(color: Settings.buttonChangeMinusColor)
                refreshUIButton.setRoundButton(color: Settings.buttonChangeRefreshColor)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTextUITextView.isEditable = false
        
        countDescriptionUILabel.setLabel(fontSize: Settings.labelFontSizeCaption, initialText: Settings.countLabelDescriptionText, screenWidth: screen.width)
        historyDescriptionUILabel.setLabel(fontSize: Settings.labelFontSizeCaption, initialText: Settings.historyLabelDescriptionText, screenWidth: screen.width)
        countUILabel.setLabel(fontSize: Settings.labelFontSizeCountValue, initialText: "\(countValue)", screenWidth: screen.width)
        
        minusUIButton.setRoundButton(backgroundColor: Settings.buttonsСhangeBackgroundColor, size: Settings.buttonsСhangeSize, borderWidth: Settings.buttonsСhangeBorderWidth, color: Settings.buttonNonActiveColor, imageSystemName: Settings.buttonChangeMinusImageSystemName)
        plusUIButton.setRoundButton(backgroundColor: Settings.buttonsСhangeBackgroundColor, size: Settings.buttonsСhangeSize, borderWidth: Settings.buttonsСhangeBorderWidth, color: Settings.buttonChangePlusColor, imageSystemName: Settings.buttonChangePlusImageSystemName)
        refreshUIButton.setRoundButton(backgroundColor: Settings.buttonsСhangeBackgroundColor, size: Settings.buttonsRefreshSize, borderWidth: Settings.buttonsRefreshBorderWidth, color: Settings.buttonNonActiveColor, imageSystemName: Settings.buttonChangeRefreshImageSystemName)
        
        refreshUIButton.frame.origin.x = screen.width / 2 - Settings.buttonsRefreshSize / 2
        minusUIButton.frame.origin.x = screen.width / 2 - Settings.buttonsСhangeSize * 2
        plusUIButton.frame.origin.x = screen.width / 2 + Settings.buttonsСhangeSize
        
    }
    
    private func addHistory(value: Int) {
        let date: String = DateFormatter().getCurrentDate()
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
