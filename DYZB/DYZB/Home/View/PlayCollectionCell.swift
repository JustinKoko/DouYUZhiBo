//
//  PlayCollectionCell.swift
//  DYZB
//
//  Created by liangxinchang on 2019/11/26.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit

class PlayCollectionCell: UICollectionViewCell {

    @IBOutlet weak var backImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.randomRGB()
    }

}
