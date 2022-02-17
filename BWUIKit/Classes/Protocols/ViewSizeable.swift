//
//  ViewSize.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/23.
//

import UIKit

public protocol ViewSizeable where Self: UIView {
    static func calculatedWidth(byHeight height: CGFloat, data: Any?) -> CGFloat
    static func calculatedHeight(byWidth width: CGFloat, data: Any?) -> CGFloat
    static func calculatedSize(withMaxSize size: CGSize, data: Any?) -> CGSize
}

extension ViewSizeable {
    static func calculatedWidth(byHeight height: CGFloat, data: Any?) -> CGFloat{
        return 0
    }
    static func calculatedHeight(byWidth width: CGFloat, data: Any?) -> CGFloat{
        return 0
    }
    static func calculatedSize(withMaxSize: CGSize, data: Any?) -> CGSize {
        return .zero
    }
}
