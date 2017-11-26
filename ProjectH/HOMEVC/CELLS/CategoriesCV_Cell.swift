//
//  CategoriesCV_Cell.swift
//  ProjectH
//
//  Created by admin on 11/26/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class CategoriesCV_Cell: UICollectionViewCell {

    @IBOutlet weak private var catImage: UIImageView!
     @IBOutlet  weak private var placeHolderImage: UIImageView!
    @IBOutlet weak var catTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCatImage(_ img : UIImage?) {
        catImage.image = img
        placeHolderImage.image = img
    }
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    class var identifier: String {
        return String(describing: self)
    }
}
