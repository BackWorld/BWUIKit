//
//  TableView.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/13.
//  Copyright © 2020 agoculture. All rights reserved.
//

import UIKit

open class TableView: UITableView, ViewAdapter, ViewTouched {
    override public func awakeFromNib() {
        super.awakeFromNib()
        didAwake()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didInit()
    }
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        didInit()
    }
    //MARK: ViewAdapter
    open func didInit(){}
    open func didAwake(){}
    open func willDeinit(){}
}
