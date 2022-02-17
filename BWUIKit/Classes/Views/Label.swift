//
//  Label.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/15.
//  Copyright © 2020 agoculture. All rights reserved.
//

import UIKit

open class Label: UILabel, ViewAdapter {
    override init(frame: CGRect) {
        super.init(frame: frame)
        didInit()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        didInit()
    }
    convenience init() {
        self.init(frame: .zero)
    }
    //MARK: ViewAdapter
    open func didInit(){}
    open func didAwake(){}
    open func willDeinit(){}
}
