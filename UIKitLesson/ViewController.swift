//
//  ViewController.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 25/04/24.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    //MARK: - Properties
    var uiElements = ["UISegmentedControl",
                      "UILabel",
                      "UISlider",
                      "UITextField",
                      "UIButton",
                      "UIDatePicker"]
    
    var selectedElement: String?
    
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
            label.text = "Now the color has turned red"
            label.textColor = .red
        case 1:
            label.text = "Now the color has turned blue"
            label.textColor = .blue
        case 2:
            label.text = "Now the color has turned green"
            label.textColor = .green
        default:
            print("smthing went wrong")
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = sender.value.description
        
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
    
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
    
    @IBAction func chaneDate(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        
        dateFormatter.locale = Locale(identifier: "tg")
        let dateValue = dateFormatter.string(from: sender.date)
        label.text = dateValue
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        segmentedControl.isHidden.toggle()
        label.isHidden.toggle()
        slider.isHidden.toggle()
        textFiled.isHidden.toggle()
        datePicker.isHidden.toggle()
        doneButton.isHidden.toggle()
        
        if !sender.isOn {
            switchLabel.text = "Скрыть все элементы"
        }
        else {
            switchLabel.text = "Отобразить все элементы"
        }
    }
    
}

//MARK: - UIPickerView: Delegate, DataSource
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        uiElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        uiElements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElements[row]
        textFiled.text = selectedElement
        
        hideAllElements()
        
        switch selectedElement {
        case "UISegmentedControl":
            segmentedControl.isHidden = false
        case "UILabel":
            label.isHidden = false
        case "UISlider":
            slider.isHidden = false
        case "UIDatePicker":
            datePicker.isHidden = false
        case "UIButton":
            doneButton.isHidden = false
        default:
            break
        }
    }
    
    private func pickerView(_ pickerView: UIPickerView, viewForRow row: Int , widthForComponent component: Int, reusing view: UIView) -> UIView {
        
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        }
        else {
            pickerViewLabel = UILabel()
        }
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 23)
        pickerViewLabel.text = uiElements[row]
        
        return pickerViewLabel
    }
    
    
}




//MARK: - Methods
extension ViewController {
    
    func setupViews() {
        
        label.text = slider.value.description
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Green", at: 2, animated: true)
        
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .darkGray
        slider.maximumTrackTintColor = .lightGray
        
        choiceUiElement()
        createToolBar()
    }
    
    func choiceUiElement() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        
        textFiled.inputView = elementPicker
    }
    
    func hideAllElements() {
        segmentedControl.isHidden = true
        label.isHidden = true
        slider.isHidden = true
        datePicker.isHidden = true
        doneButton.isHidden = true
    }
    
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        textFiled.inputAccessoryView = toolBar
    }
        
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
