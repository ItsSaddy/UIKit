//
//  ViewController.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 25/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = "The first segment is selcted"
        label.textColor = .red
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
    }
    
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        label.isHidden = false
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selcted"
            label.textColor = .red
        case 1:
            label.text = "The second segment is selected"
            label.textColor = .blue
        case 2:
            label.text = "The third segment is selected"
            label.textColor = .yellow
        default:
            print("smthing went wrong")
        }
    }
    
    
    
}
