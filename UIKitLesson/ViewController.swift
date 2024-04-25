//
//  ViewController.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 25/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet var actionButtons: [UIButton]!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        label.font = label.font.withSize(35)
        label.textColor = .red
        
        button.isHidden = true
        for button in actionButtons{
            button.setTitleColor(.blue, for: .normal)
            button.backgroundColor = .green
        }
        
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        label.isHidden = false
        button.isHidden = false
        
        if sender.tag == 0 {
            label.text = "Hello Guys!"
            label.textColor = .red
        }
        else if sender.tag == 1 {
            label.text = "Hi there!"
            label.textColor = .blue
        }
        else if sender.tag == 2 {
            label.isHidden = true
            button.isHidden = true
        }

    }
    
}

