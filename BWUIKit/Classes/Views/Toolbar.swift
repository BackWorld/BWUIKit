//
//  Toolbar.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/28.
//

import UIKit

open class Toolbar: UIToolbar, ViewAdapter {
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
