//
//  DetailVC.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 29/04/24.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var trackTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = trackTitle
        image.image = UIImage(named: trackTitle)
        titleLabel.numberOfLines = 0
        
    }
}
