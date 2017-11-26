//
//  HomePageTableViewCell.swift
//  ProjectH
//
//  Created by admin on 11/25/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var seeMore: UIButton!
//    @IBOutlet weak var categorytitle: UILabel!

    var catIndexPath  : Int?

 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCell.nib, forCellWithReuseIdentifier: ProductCell.identifier)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}




extension HomePageTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  
        return 5
    }
    
    //    let  cartDetails = CartDetails()
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
        
        
        return cell 
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //
     
        guard let cellSize = ad.cellSize else {
            return CGSize(width: 250, height: 234)
        }
        return cellSize
    }
}

