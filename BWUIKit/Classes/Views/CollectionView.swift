//
//  CollectionView.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/13.
//  Copyright © 2020 agoculture. All rights reserved.
//

import UIKit

open class CollectionView: UICollectionView, ViewAdapter{
    override public func awakeFromNib() {
        super.awakeFromNib()
        didAwake()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didInit()
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        didInit()
    }
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        self.init(frame: .zero, collectionViewLayout: layout)
    }
    
    //MARK: ViewAdapter
    open func didInit(){}
    open func didAwake(){}
    open func willDeinit(){}
}
