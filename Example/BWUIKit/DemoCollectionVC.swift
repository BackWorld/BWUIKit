//
//  DemoCollectionVC.swift
//  BWUIKit_Example
//
//  Created by zhuxuhong on 2022/2/17.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import BWUIKit
import BWListKit

class DemoCollectionVC: CollectionViewController {
    override func didLoad() {
        super.didLoad()
        
        makeListData()
    }
    
    func makeListData() {
        let items: [BWListItem] = (0..<100).map{
            .init(reuseId: CollectionCell.RID, width: 60, height: 60, data: $0)
        }
        
        listAdapter.data = .init(registers: [
            .init(style: .cell, class: CollectionCell.self)
        ], sections: [
            .init(layout: .init(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), minimumInteritemSpacing: 20, minimumLineSpacing: 20), items: items)
        ])
    }
}

class CollectionCell: CollectionViewCell {
    lazy var textLabel: Label = .init()
    
    override func didInit() {
        contentView.addSubview(textLabel)
        textLabel.textAlignment = .center
        textLabel.frame = contentView.bounds
        textLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        textLabel.textColor = .red
        textLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    override open func bwListItemViewConfigure(_ data: Any?, indexPath: IndexPath) {
        textLabel.text = "\(data as! Int)"
    }
}
