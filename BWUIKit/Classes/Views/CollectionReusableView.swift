//
//  CollectionReusableView.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/16.
//  Copyright © 2020 agoculture. All rights reserved.
//

import BWListKit

open class CollectionReusableView: UICollectionReusableView, ViewAdapter, BWListItemView {
    override public func awakeFromNib() {
        super.awakeFromNib()
        didAwake()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        didInit()
    }
    open func bwListItemViewConfigure(_ data: Any?, indexPath: IndexPath) {
    }
    
    //MARK: ViewAdapter
    open func didInit(){}
    open func didAwake(){}
    open func willDeinit(){}
}
