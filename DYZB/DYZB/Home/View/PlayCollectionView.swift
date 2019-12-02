//
//  PlayCollectionView.swift
//  DYZB
//
//  Created by liangxinchang on 2019/11/26.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit

class PlayCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{
    
    fileprivate lazy var dataArr:[LiveModel] = [LiveModel]()
    
    func setCollectionView(dataArr : [LiveModel]) {
        self.dataArr = dataArr
        self.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArr.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : PlayCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCollectionCell", for: indexPath) as! PlayCollectionCell
        cell.fillPlayCollectionCell(model: self.dataArr[indexPath.row])
        return cell;
        
    }
    

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self;
        self.dataSource = self;
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
