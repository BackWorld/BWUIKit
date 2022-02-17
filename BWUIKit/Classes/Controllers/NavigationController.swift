//
//  NavigationController.swift
//  ASW
//
//  Created by BirdMichael on 2020/4/27.
//  Copyright © 2020 BirdMichael. All rights reserved.
//

import UIKit

open class NavigationController: UINavigationController, ViewControllerAdapter, ViewTouched, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    open override var prefersStatusBarHidden: Bool {
        return topViewController?.prefersStatusBarHidden ?? false
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if !viewControllers.isEmpty {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        didInit()
    }
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        didInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didInit()
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let vc = topViewController as? NavigationBarOperation else {
            return false
        }
        return vc.navBarShouldPanBack
    }
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if let bar = viewController.navigationController?.navigationBar,
           let vc = viewController as? NavigationBarConfigure & NavigationBarOperation
        {
            let opaque = !vc.navBarTransparent
            bar.isHidden = vc.navBarNeedsHidden
            bar.tintColor = vc.navBarTintColor
            bar.isTranslucent = opaque ? vc.navBarTranslucent : true
            bar.barTintColor = opaque ? vc.navBarTintColor : .clear
            bar.backgroundColor = opaque ? vc.navBarBackgroundColor : .clear
            bar.setBackgroundImage(opaque ? vc.navBarBackgroundImage : .init(), for: .default)
            bar.shadowImage = opaque ? vc.navBarShadowImage : nil
            bar.titleTextAttributes = vc.navBarTitleAttributes
            interactivePopGestureRecognizer?.isEnabled = vc.navBarShouldPanBack
        }
    }
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touchBegan(touch: touches.first!)
    }
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touchEnded(touch: touches.first!)
    }
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        touchCancelled(touch: touches.first!)
    }
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        touchMoved(touch: touches.first!)
    }
    
    //MARK: ViewTouched
    open func touchBegan(touch: UITouch){}
    open func touchEnded(touch: UITouch){}
    open func touchCancelled(touch: UITouch){}
    open func touchMoved(touch: UITouch){}
    
    //MARK: ViewControllerAdapter
    open func didInit(){
        delegate = self
        interactivePopGestureRecognizer?.delegate = self
    }
    open func didAwake(){}
    open func willDeinit(){}
    open func didLoad(){}
    open func willLayout(){}
    open func didLayout(){}
    open func willAppear(){}
    open func didAppear(){}
    open func willRotate(){}
    open func didRotated(previousTrait: UITraitCollection?, currentTrait: UITraitCollection){}
    open func willDisapppear(){}
    open func didDisappear(){}
    
}
