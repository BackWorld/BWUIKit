//
//  NavigationBarCofigure.swift
//  RaveLand
//
//  Created by CS001 on 2021/4/12.
//  Copyright © 2021 CSLY. All rights reserved.
//

import UIKit

public protocol NavigationBarConfigure {
    var navBar: UINavigationBar? {get}
    var navBarTintColor: UIColor? {get set}
    var navBarBarTintColor: UIColor? {get set}
    var navBarBackgroundColor: UIColor? {get set}
    var navBarBackIndicatorImage: UIImage? {get set}
    var navBarBackIndicatorMaskImage: UIImage? {get set}
    var navBarBackgroundImage: UIImage? {get set}
    var navBarShadowImage: UIImage? {get set}
    var navBarTranslucent: Bool {get set}
    var navBarOpaque: Bool {get set}
    var navBarTransparent: Bool {get set}
    var navBarTitleAttributes: [NSAttributedString.Key: Any]? {get set}
}

public protocol NavigationBarOperation {
    var navBarNeedsHidden: Bool {get set}
    var navBarShouldPanBack: Bool {get set}
}

public protocol NavigationItemConfigure {
    var navItem: UINavigationItem? {get}
    var navTitle: String? {get set}
    var navTitleView: UIView? {get set}
    var navLeftBtns: [UIBarButtonItem]? {get set}
    var navRightBtns: [UIBarButtonItem]? {get set}
}

extension NavigationBarConfigure {
    var navBar: UINavigationBar? {
        fatalError("You must override this property in your class!")
    }
}

