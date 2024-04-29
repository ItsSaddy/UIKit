//
//  ViewController.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 25/04/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textViewButtonConstraint: NSLayoutConstraint!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - @IBActions
    @IBAction func fontSize(_ sender: UIStepper) {
        let font = textView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        textView.font = UIFont(name: font!, size: fontSize)
    }
}

//MARK: - UITextViewDelegate
extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .gray
        textView.textColor = .lightGray
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    
    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        countLabel.text = (textView.text.count + (text.count - range.length)).description
        return textView.text.count + (text.count - range.length) < 60
    }
    
    @objc func updateTextView(notification: Notification) {
        guard
            let userInfo = notification.userInfo as? [String: Any],
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        }
        else {
            textView.contentInset = UIEdgeInsets(top: 0,
                                                 left: 0,
                                                 bottom: keyboardFrame.height - textViewButtonConstraint.constant,
                                                 right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        
        textView.scrollRangeToVisible(textView.selectedRange)
    }
    
}

//MARK: - Touch handling
extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

//MARK: Setup Views
private extension ViewController {
    func setupViews() {
        //textView
        textView.delegate = self
        textView.isHidden = true
        textView.alpha = 0
        textView.font = .systemFont(ofSize: 17, weight: .regular)
        textView.layer.cornerRadius = 10
        
        //stepper
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        
        //activityIndicator
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
        
        //Observing keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        UIView.animate(withDuration: 0, delay: 5, animations: { [weak self] in
            guard let self = self else { return }
            
            textView.alpha = 1
        }) { [weak self] (finished) in
            guard let self = self else { return }
            
            activityIndicator.stopAnimating()
            textView.isHidden = false
            view.isUserInteractionEnabled = true
            
        }
    }
    
}

