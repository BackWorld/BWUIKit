//
//  Control.swift
//  RaveLand
//
//  Created by zhuxuhong on 2021/4/23.
//  Copyright © 2021 CSLY. All rights reserved.
//

import UIKit

open class Control: UIControl, ViewAdapter {
    override init(frame: CGRect) {
        super.init(frame: frame)
        didInit()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        didInit()
    }
    open override func awakeFromNib() {
        super.awakeFromNib()
        didAwake()
    }
    
    //MARK: ViewAdapter
    open func didInit(){}
    open func didAwake(){}
    open func willDeinit(){}
}
