//
//  TableViewCell.swift
//  faceWeather
//
//  Created by Dương chãng on 2/17/20.
//  Copyright © 2020 macshop. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var view: UILabel!
    
    @IBOutlet weak var ten: UILabel!
    
    @IBOutlet weak var anhcell: UIImageView!
    
    @IBOutlet weak var doc: UILabel!
    
    @IBOutlet weak var songay: UILabel!
    
    
    // set dữ liệu trung gian 
    var anhs: weather? {
        didSet {
            if let data = anhs {
                ten.text = data.tenthu
                anhcell.image = UIImage(named: data.anh)
                doc.text = data.nhietdo
                songay.text = data.ngay
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
