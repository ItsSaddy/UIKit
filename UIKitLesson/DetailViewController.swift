//
//  DetailViewController.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 01/05/24.
//

import UIKit

class DetailViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    let imageNameArray = ["Голодный пёс (Hungry Dog) - Soda Luv",
                          "Cristal & МОЁТ (Remix) - Soda Luv",
                          "ХОТБОКС (HOTBOX) - Soda Luv",
                          "Блэсс гад (Bless god) - Soda Luv",
                          "ЯЛРС (ILDB) - Soda Luv"]
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        cell.textLabel?.text = imageNameArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = parent as? ViewController {
            let trackTitle = imageNameArray[indexPath.row]
            viewController.titleLabel.text = trackTitle
            viewController.imageCover.image = UIImage(named: trackTitle)
        }
    }
}
