//
//  TableViewHeaderFooter.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/16.
//  Copyright © 2020 agoculture. All rights reserved.
//

import BWListKit

open class TableViewHeaderFooter: UITableViewHeaderFooterView, ViewAdapter, BWListItemView {
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        didInit()
    }
    open override func awakeFromNib() {
        super.awakeFromNib()
        didAwake()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didInit()
    }
    
    open func bwListItemViewConfigure(_ data: Any?, indexPath: IndexPath) {
    }
    
    //MARK: ViewAdapter
    open func didInit(){}
    open func didAwake(){}
    open func willDeinit(){}
}
