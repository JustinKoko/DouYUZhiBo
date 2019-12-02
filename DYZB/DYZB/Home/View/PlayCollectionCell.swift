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
    
    public func fillPlayCollectionCell(model:LiveModel) {
        self.titleLabel.text = model.nickname
        let url = URL(string: model.photo)
        do {
            let data = try Data.init(contentsOf: url!)
            self.backImgView.image = UIImage(data: data)
        } catch  {}
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.randomRGB()
    }

}
