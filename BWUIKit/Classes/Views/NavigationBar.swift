//
//  NavigationBar.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/28.
//

import UIKit

open class NavigationBar: UINavigationBar, ViewAdapter {
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

extension NavigationBar: NavigationBarConfigure {
    public var navBar: UINavigationBar? {
        return self
    }
    
    public var navBarTintColor: UIColor? {
        get{
            navBar?.tintColor
        }
        set{
            navBar?.tintColor = newValue
        }
    }
    public var navBarBarTintColor: UIColor? {
        get{
            navBar?.barTintColor
        }
        set{
            navBar?.barTintColor = newValue
        }
    }
    public var navBarBackgroundColor: UIColor? {
        get{
            navBar?.backgroundColor
        }
        set{
            navBar?.backgroundColor = newValue
        }
    }
    public var navBarBackIndicatorImage: UIImage? {
        get{
            navBar?.backIndicatorImage
        }
        set{
            navBar?.backIndicatorImage = newValue
        }
    }
    public var navBarBackIndicatorMaskImage: UIImage? {
        get{
            navBar?.backIndicatorTransitionMaskImage
        }
        set{
            navBar?.backIndicatorTransitionMaskImage = newValue
        }
    }
    public var navBarBackgroundImage: UIImage? {
        get{
            navBar?.backgroundImage(for: .default)
        }
        set{
            navBar?.setBackgroundImage(newValue, for: .default)
        }
    }
    public var navBarShadowImage: UIImage? {
        get{
            navBar?.shadowImage
        }
        set{
            navBar?.shadowImage = newValue
        }
    }
    public var navBarTitleAttributes: [NSAttributedString.Key: Any]? {
        get{
            navBar?.titleTextAttributes
        }
        set{
            navBar?.titleTextAttributes = newValue
        }
    }
    public var navBarTranslucent: Bool {
        get{
            navBar?.isTranslucent ?? false
        }
        set{
            navBar?.isTranslucent = newValue
        }
    }
    public var navBarOpaque: Bool {
        get{
            navBar?.isOpaque ?? true
        }
        set{
            navBar?.isOpaque = newValue
        }
    }
    
    public var navBarTransparent: Bool {
        get{
            return !navBarOpaque
            && navBarTranslucent
            && navBarBackgroundColor == .clear
            && navBarTintColor == .clear
            && navBarBackgroundImage == nil
            && navBarShadowImage == nil
        }
        set{
            navBarOpaque = false
            navBarTranslucent = true
            navBarBackgroundColor = .clear
            navBarTintColor = .clear
            navBarBackgroundImage = nil
            navBarShadowImage = nil
        }
    }
}

