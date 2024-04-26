//
//  ViewController.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 25/04/24.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - IBActions
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
    
    //MARK: sliderAction
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = sender.value.description
        
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
    
    //MARK: doneButtonAction
    @IBAction func donePressed(_ sender: UIButton) {
        guard let text = textFiled.text, !text.isEmpty else { return }
        let isOnlyLetter = text.reduce(true) { $0 && $1.isLetter }
        
        label.isHidden = false
        
        if isOnlyLetter {
            label.text = text
        }
        else {
            let alert = UIAlertController(title: "Wrong format", message: "Please, enter your name", preferredStyle: .alert)
            let okAlert = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAlert)
            present(alert, animated: true)
        }
        
        textFiled.text = nil
        
    }
    
}

//MARK: - Setup views
extension ViewController {
    func setupViews() {
        label.text = slider.value.description
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .darkGray
        slider.maximumTrackTintColor = .lightGray
    }
}
