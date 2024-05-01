//
//  ViewController.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 30/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPresentation()
    }
    
    func startPresentation() {
        if let pageViewController = storyboard?.instantiateViewController(
            withIdentifier: "PageViewController") as? PageViewController {
            present(pageViewController, animated: true)
        }
    }
}
