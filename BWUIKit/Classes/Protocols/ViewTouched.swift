//
//  ViewTouched.swift
//  BWUIKit
//
//  Created by zhuxuhong on 2022/2/16.
//

import UIKit

public protocol ViewTouched where Self: UIResponder {
    func touchBegan(touch: UITouch)
    func touchEnded(touch: UITouch)
    func touchCancelled(touch: UITouch)
    func touchMoved(touch: UITouch)
}

extension ViewTouched{
    public func touchBegan(touch: UITouch){}
    public func touchEnded(touch: UITouch){}
    public func touchCancelled(touch: UITouch){}
    public func touchMoved(touch: UITouch){}
}
