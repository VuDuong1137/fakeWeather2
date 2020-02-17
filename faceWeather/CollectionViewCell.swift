//
//  CollectionViewCell.swift
//  faceWeather
//
//  Created by Dương chãng on 2/17/20.
//  Copyright © 2020 macshop. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var lable1: UILabel!
    
    
    @IBOutlet weak var uiimage: UIImageView!
    
    @IBOutlet weak var uilable2: UILabel!

    var anh2: weather2?{
        didSet{
            if let data = anh2{
                lable1.text = data.Tenthu2
                uiimage.image = UIImage(named: data.anh2)
                uilable2.text = data.ngay2
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
