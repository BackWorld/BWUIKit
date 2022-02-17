//
//  Slider.swift
//  ASW
//
//  Created by zhuxuhong on 2020/12/6.
//

import UIKit

open class Slider: UISlider, ViewAdapter {
    override init(frame: CGRect) {
        super.init(frame: frame)
        didInit()
    }
    open override func awakeFromNib() {
        super.awakeFromNib()
        didAwake()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        didInit()
    }
    //MARK: ViewAdapter
    open func didInit(){}
    open func didAwake(){}
    open func willDeinit(){}
}

