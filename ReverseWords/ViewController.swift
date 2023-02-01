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
    
    private let reverseManager = ReverseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        modeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        
        outputLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelDidGetTapped))
        outputLabel.addGestureRecognizer(tapGesture)
        
        setTextFieldForCustomMode(reverseMode: .defaultMode)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(disableTextFieldForReversing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func labelDidGetTapped(sender: UITapGestureRecognizer) {
        guard let label = sender.view as? UILabel else {
            return
        }
        UIPasteboard.general.string = label.text
        outputLabel.textColor = UIColor.white
        outputLabel.backgroundColor = UIColor.gray
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            outputLabel.textColor = UIColor.black
            outputLabel.backgroundColor = UIColor.white
        }
    }
    
    @objc func disableTextFieldForReversing() {
        self.view.endEditing(true)
    }
    
    private func setTextFieldForCustomMode(reverseMode: ReverseMode) {
        
        self.reverseMode = reverseMode
        
        switch reverseMode {
        case .defaultMode:
            textFieldForCustomMode.isEnabled = false
            textFieldForCustomMode.alpha = 0
            
        case .customMode:
            textFieldForCustomMode.isEnabled = true
            textFieldForCustomMode.alpha = 1
        }
    }
    
    @IBAction func textFieldForReversingAction(_ sender: UITextField) {
        
        switch reverseMode {
        case .defaultMode:
            outputLabel.text = reverseManager.reverseWordsExceptAlphabeticSymbols(of: textFieldForReversing.text ?? "")
            
        case .customMode:
            outputLabel.text = reverseManager.reverseWords(of: textFieldForReversing.text ?? "", ignore: textFieldForCustomMode.text ?? "")
        }
    }
    
    @IBAction func switchModeSegmentedControl(_ sender: UISegmentedControl) {
        
        if modeSegmentedControl.selectedSegmentIndex == 0 {
            setTextFieldForCustomMode(reverseMode: .defaultMode)
        } else {
            setTextFieldForCustomMode(reverseMode: .customMode)
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






