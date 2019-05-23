//
//  SecondViewController.swift
//  sample1
//
//  Created by Jing Li on 5/21/19.
//  Copyright © 2019 Jing Li. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    var activeTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var tapticButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for button in tapticButtons {
            button.layer.cornerRadius = button.frame.size.height/2
        }
        
        registerForKeyboardNotifications()
        textField.delegate = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        deregisterForKeyboardNotification()
    }

    func registerForKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func deregisterForKeyboardNotification() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWasShown(notification: NSNotification) {
        
        self.scrollView.isScrollEnabled = true
        
        var userInfo = notification.userInfo!
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize!.height, right: 0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
        var frameRect: CGRect = self.view.frame
        frameRect.size.height -= keyboardSize!.height
        if let activeField = self.activeTextField {
            let activeOrigin =  activeField.frame.origin
            if frameRect.contains(activeOrigin) {
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    @objc func keyboardWillDisappear(notification: NSNotification) {
        
        var userInfo = notification.userInfo!
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -keyboardSize!.height, right: 0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        self.view.endEditing(true)
        
        self.scrollView.isScrollEnabled = false
    }
    
    //TextField Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func eventOneSendPressed(_ sender: Any) {
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }
    
    @IBAction func eventTwoSendPressed(_ sender: Any) {
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }
    
    
    @IBAction func eventThreeSendPressed(_ sender: Any) {
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }
    
    @IBAction func sliderMoved(_ sender: Any) {
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
}

