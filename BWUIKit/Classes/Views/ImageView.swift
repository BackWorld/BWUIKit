//
//  ImageView.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/13.
//  Copyright © 2020 agoculture. All rights reserved.
//

import UIKit

open class ImageView: UIImageView, ViewAdapter {
    convenience init() {
        self.init(frame: .zero)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        didInit()
    }
    override init(image: UIImage?) {
        super.init(image: image)
        didInit()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
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
