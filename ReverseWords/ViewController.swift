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
        
    @IBOutlet weak var textFieldForCustomMode: UITextField!
    
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
        
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
    
    @IBAction func textFieldForReversingAction(_ sender: UITextField) {
        
        if reverseMode == .defaultMode {
            outputLabel.text = ReverseManager().reverseWordsExceptAlphabeticSymbols(of: textFieldForReversing.text ?? "")
        } else {
            outputLabel.text = ReverseManager().reverseWords(of: textFieldForReversing.text ?? "", ignore: textFieldForCustomMode.text ?? "")
        }
    }
    
    @IBAction func switchModeSegmentedControl(_ sender: UISegmentedControl) {
        
        if modeSegmentedControl.selectedSegmentIndex == 0 {
            setTextFieldForCustomMode(isEnabled: false, alpha: 0)
            reverseMode = .defaultMode
        } else {
            setTextFieldForCustomMode(isEnabled: true, alpha: 1)
            reverseMode = .customMode
        }
        textFieldForReversingAction(textFieldForReversing)
    }
    
    @IBAction func textFieldForCustomModeAction(_ sender: UITextField) {
        textFieldForReversingAction(textFieldForReversing)
    }
}

extension ViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}






