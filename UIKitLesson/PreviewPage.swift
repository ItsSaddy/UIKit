//
//  PreviewPage.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 29/04/24.
//

import UIKit

private let reuseIdentifier = "ArtCover"

class PreviewPage: UICollectionViewController {
    
    let imageNameArray = ["Блэсс гад (Bless god) - Soda Luv",
                          "Голодный пёс (Hungry Dog) - Soda Luv",
                          "ХОТБОКС (HOTBOX) - Soda Luv",
                          "ЯЛРС (ILDB) - Soda Luv",
                          "Cristal & МОЁТ (Remix) - Soda Luv"]
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageNameArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCoverCell
        
        cell.coverImageView.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell
    }
}
