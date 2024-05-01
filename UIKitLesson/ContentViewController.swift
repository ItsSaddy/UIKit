//
//  ContentViewController.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 01/05/24.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var textContent: UILabel!
    @IBOutlet weak var textEmoji: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var presentText = ""
    var emoji = ""
    var currentPage = 0
    var numbersOfPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textContent.text = presentText
        textEmoji.text = emoji
        pageControl.numberOfPages = numbersOfPage
        pageControl.currentPage = currentPage
    }
}
