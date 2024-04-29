//
//  trackList.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 29/04/24.
//

import UIKit

class TrackList: UITableViewController {
    let imageNameArray = ["Голодный пёс (Hungry Dog) - Soda Luv",
                          "Cristal & МОЁТ (Remix) - Soda Luv",
                          "ХОТБОКС (HOTBOX) - Soda Luv",
                          "Блэсс гад (Bless god) - Soda Luv",
                          "ЯЛРС (ILDB) - Soda Luv"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
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
   
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailVC
                detailVC.trackTitle = imageNameArray[indexPath.row]
            }
        }
    }
}
