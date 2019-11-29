//
//  TitlteChildViewController.swift
//  DYZB
//
//  Created by 梁新昌 on 2019/10/18.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit

class TitlteChildViewController: UIViewController {
    
    var page : Int = 0
    
    lazy var collectionView: PlayCollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: kScreenW / 2.0, height: kScreenW / 2.0 + 20)
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        let collectionView = PlayCollectionView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: kScreenH - kNavigationBarH - kTableBarH - kStatusBarH), collectionViewLayout: flowLayout)
        collectionView.register(UINib.init(nibName: "PlayCollectionCell", bundle: nil), forCellWithReuseIdentifier: "PlayCollectionCell")
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.collectionView)
        self.sendRequest()

    }

    func setScrollIndex(scrollIndex: Int) {
        self.page = scrollIndex
    }
    
    func sendRequest() {
        NetWorkTool.requestData(type: .GET, urlString: "\(liveUrl)?page=\(String(self.page))", parameters: nil, header: nil) { (response) in
            guard let data = response["data"] else {
                print("data数据为空")
                return
            }
            let dataDic = data as! NSDictionary
            guard let list = dataDic["list"] else {
                print("list数据为空")
                return
            }
            let listArr = list as! NSArray
            print(listArr)
            
        }
    }
    
}
