
//
//  HeaderPageHeaderV.swift
//  ProjectH
//
//  Created by admin on 11/26/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import UIKit

extension HomeVC  : UICollectionViewDelegateFlowLayout , UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard collectionView == categoriesCollectionView else {
         return imagelist.count
        }
        return imagelist.count
    }
    
    //    let  cartDetails = CartDetails()
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard collectionView == categoriesCollectionView else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandsCell", for: indexPath) as! BrandsCell
            cell.brandImage.image = imagelist[indexPath.row]

            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCV_Cell.identifier, for: indexPath) as! CategoriesCV_Cell
        
        let img = imagelist[indexPath.row]
        cell.setCatImage(img)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard collectionView == categoriesCollectionView else {
            return CGSize(width: 154, height: 70)
        }
        if indexPath.item == 0 {
            return CGSize(width: self.categoriesCollectionView.frame.width / 2, height:self.categoriesCollectionView.frame.width / 2)
            
        }
         return CGSize(width: 274 / 2.2, height:274 / 2.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
 
        return 1
    }
    
}



class BrandsCell: UICollectionViewCell {
    
    @IBOutlet weak var brandImage: UIImageView!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
}

