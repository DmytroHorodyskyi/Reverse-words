//
//  ViewController.swift
//  Reverse words
//
//  Created by Dmytro Horodyskyi on 16.01.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    private enum ReverseMode {
        case defaultMode, customMode
    }
    
    @IBOutlet weak var textFieldForReversing: UITextField!
    
    @IBOutlet weak var labelForDefaultMode: UILabel!
    
    @IBOutlet weak var textFieldForCustomMode: UITextField!
    
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var showResultButton: UIButton!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    private var reverseMode: ReverseMode = .defaultMode
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldForCustomMode(isEnabled: false, alpha: 0)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(disableTextFieldForReversing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func disableTextFieldForReversing() {
        self.view.endEditing(true)
    }
    
    func setTextFieldForCustomMode(isEnabled: Bool, alpha: CGFloat) {
        
        textFieldForCustomMode.isEnabled = isEnabled
        textFieldForCustomMode.alpha = alpha
    }
    
    @IBAction func switchModeSegmentedControl(_ sender: UISegmentedControl) {
        
        if modeSegmentedControl.selectedSegmentIndex == 0 {
            setTextFieldForCustomMode(isEnabled: false, alpha: 0)
            reverseMode = .defaultMode
            outputLabel.text = " "
        } else {
            setTextFieldForCustomMode(isEnabled: true, alpha: 1)
            reverseMode = .customMode
            outputLabel.text = " "
        }
    }
    
    @IBAction func showResultButtonAction(_ sender: UIButton) {
        
        if reverseMode == .defaultMode {
            outputLabel.text = ReverseManager().reverseWordsExceptAlphabeticSymbols(of: textFieldForReversing.text ?? "")
        } else {
            outputLabel.text = ReverseManager().reverseWords(of: textFieldForReversing.text ?? "", ignore: textFieldForCustomMode.text ?? "")
        }
    }
}

extension ViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}






