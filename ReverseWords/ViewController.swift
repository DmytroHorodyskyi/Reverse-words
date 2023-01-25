//
//  ViewController.swift
//  Reverse words
//
//  Created by Dmytro Horodyskyi on 16.01.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    private enum ButtonState {
        case readyToReverse, readyToClear
    }
    
    @IBOutlet weak var textFieldForReversing: UITextField!
    
    @IBOutlet weak var showResultButton: UIButton!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var underline: UIView!
    
    private var buttonState:ButtonState = .readyToReverse
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cleanFields()
        setShowResultButton(isEnabled: false)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(disableTextFieldForReversing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func disableTextFieldForReversing() {
        self.view.endEditing(true)
        underline.backgroundColor = UIColor.systemGray3
    }
    
    
    func setShowResultButton(isEnabled: Bool? = nil, title: String? = nil, alpha: CGFloat? = nil) {
        
        
        if let isEnabled = isEnabled {
            showResultButton.isEnabled = isEnabled
        }
        if let title = title {
            showResultButton.setTitle(title, for: .normal)
        }
        if let alpha = alpha {
            showResultButton.alpha = alpha
        }
        showResultButton.backgroundColor = UIColor.systemBlue
        showResultButton.layer.cornerRadius = 10
        showResultButton.setTitleColor(UIColor.white, for: .disabled)
    }
    
    func cleanFields() {
        outputLabel.text = ""
        textFieldForReversing.text = ""
    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        if (textFieldForReversing.text != "") && buttonState == .readyToReverse {
            outputLabel.text = ReverseManager().reverseWords(of: textFieldForReversing.text ?? "")
            setShowResultButton(isEnabled: true, title: "Clear")
            buttonState = .readyToClear
            
        } else {
            cleanFields()
            setShowResultButton(isEnabled: false, title: "Reverse", alpha: 0.5)
            buttonState = .readyToReverse
        }
    }
}

extension ViewController {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = (textField.text as? NSString)?.replacingCharacters(in: range, with: string) {
            
            if text.isEmpty {
                setShowResultButton(isEnabled: false, alpha: 0.5)
                
            } else {
                setShowResultButton(isEnabled: true, title: "Reverse", alpha: 1.0)
                buttonState = .readyToReverse
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == textFieldForReversing {
            underline.backgroundColor = UIColor.systemBlue
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}






