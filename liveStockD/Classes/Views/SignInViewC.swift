//
//  SignInViewC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 26/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class SignInViewC: UIViewController {

        @IBOutlet weak var signInWithGoogle: UIButton!
        @IBOutlet weak var logo: UIImageView!
        @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
        
        var currentlyActiveTextField : UITextField?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            signInWithGoogle.layer.borderColor = UIColor(red: 218, green: 218, blue: 218).cgColor
            signInWithGoogle.layer.borderWidth = 2
            self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleBackgroundViewTap(_:))))
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            addKeyboardObservers()
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillAppear(animated)
            removeKeyboardObservers()
        }
        
        func addKeyboardObservers(){
            //This will trigger the selector when keyboard appears
            NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShowing), name: UIResponder.keyboardWillShowNotification, object: nil)
            
            //This will trigger the selector when keyboard disappears
            NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardDisappearing), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        @objc func handleKeyboardShowing(notification : NSNotification){
            guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            //Get the frame(x,y co-ordinates and its width, height)
            let keyboardScreenEndFrame = keyboardValue.cgRectValue
            //Pushing the textfield above the keyboard
            scrollViewBottomConstraint.constant = -keyboardScreenEndFrame.height
        }
        
        @objc func handleBackgroundViewTap(_ sender: UITapGestureRecognizer? = nil) {
            currentlyActiveTextField?.resignFirstResponder()
        }
        
        @objc func handleKeyboardDisappearing(notification : NSNotification){
            //Get the textfield back to the bottom
            scrollViewBottomConstraint?.constant = 0
        }
        
        func removeKeyboardObservers(){
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }


extension SignInViewC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentlyActiveTextField = textField
    }
}
