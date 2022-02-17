//
//  ViewController.swift
//  ASW
//
//  Created by BirdMichael on 2020/4/27.
//  Copyright © 2020 BirdMichael. All rights reserved.
//

import UIKit

open class ViewController: UIViewController{
    open var statusBarHidden: Bool = UIApplication.shared.isStatusBarHidden {
        didSet{
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    open var statusBarStyle: UIStatusBarStyle = UIApplication.shared.statusBarStyle {
        didSet{
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    open var homeIndicatorHidden: Bool = false {
        didSet{
            if #available(iOS 11.0, *) {
                setNeedsUpdateOfHomeIndicatorAutoHidden()
            }
        }
    }
    
    open override var prefersStatusBarHidden: Bool {
        return statusBarHidden
    }
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return statusBarStyle
    }
    open override func prefersHomeIndicatorAutoHidden() -> Bool {
        return homeIndicatorHidden
    }
    public convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        didInit()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        didInit()
    }
    public override func awakeFromNib() {
        super.awakeFromNib()
        didAwake()
    }
    open override func viewDidLoad() {
        super.viewDidLoad()
        didLoad()
    }
    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if isViewLoaded {
            willRotate()
        }
    }
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        didRotated(previousTrait: previousTraitCollection, currentTrait: traitCollection)
    }
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        willAppear()
    }
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didAppear()
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        willDisapppear()
    }
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        willLayout()
    }
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        didLayout()
    }
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        didDisappear()
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
    
    deinit{
        willDeinit()
    }
    
    //MARK: ViewTouched
    open func touchBegan(touch: UITouch){}
    open func touchEnded(touch: UITouch){}
    open func touchCancelled(touch: UITouch){}
    open func touchMoved(touch: UITouch){}
    
    //MARK: ViewControllerAdapter
    open func didInit(){}
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

extension ViewController: ViewControllerAdapter{}

extension ViewController: ViewTouched{}

//MARK: - Navigation Bar Configure
extension ViewController: NavigationItemConfigure {
    public var navItem: UINavigationItem? {
        return navigationItem
    }
    
    public var navLeftBtns: [UIBarButtonItem]? {
        get{
            return navItem?.leftBarButtonItems
        }
        set{
            navItem?.setLeftBarButtonItems(newValue, animated: false)
        }
    }
    public var navRightBtns: [UIBarButtonItem]? {
        get{
            return navItem?.rightBarButtonItems
        }
        set{
            navItem?.setRightBarButtonItems(newValue, animated: false)
        }
    }
    public var navTitle: String? {
        get {
            return navItem?.title
        }
        set {
            navItem?.title = newValue
        }
    }
    public var navTitleView: UIView? {
        get {
            return navItem?.titleView
        }
        set{
            navItem?.titleView = newValue
        }
    }
}

extension ViewController: NavigationBarConfigure {
    public var navBar: UINavigationBar? {
        return navigationController?.navigationBar
    }
    
    public var navBarTintColor: UIColor? {
        get{
            return navBar?.tintColor
        }
        set{
            navBar?.tintColor = newValue
        }
    }
    public var navBarBarTintColor: UIColor? {
        get{
            return navBar?.barTintColor
        }
        set{
            navBar?.barTintColor = newValue
        }
    }
    public var navBarBackgroundColor: UIColor? {
        get{
            return navBar?.backgroundColor
        }
        set{
            navBar?.backgroundColor = newValue
        }
    }
    public var navBarBackIndicatorImage: UIImage? {
        get{
            return navBar?.backIndicatorImage
        }
        set{
            navBar?.backIndicatorImage = newValue
        }
    }
    public var navBarBackIndicatorMaskImage: UIImage? {
        get{
            return navBar?.backIndicatorTransitionMaskImage
        }
        set{
            navBar?.backIndicatorTransitionMaskImage = newValue
        }
    }
    public var navBarBackgroundImage: UIImage? {
        get{
            return navBar?.backgroundImage(for: .default)
        }
        set{
            navBar?.setBackgroundImage(newValue, for: .default)
        }
    }
    public var navBarShadowImage: UIImage? {
        get{
            return navBar?.shadowImage
        }
        set{
            navBar?.shadowImage = newValue
        }
    }
    public var navBarTitleAttributes: [NSAttributedString.Key: Any]? {
        get{
            return navBar?.titleTextAttributes
        }
        set{
            navBar?.titleTextAttributes = newValue
        }
    }
    public var navBarTranslucent: Bool {
        get{
            return navBar?.isTranslucent ?? false
        }
        set{
            navBar?.isTranslucent = newValue
            navBar?.isOpaque = !newValue
        }
    }
    public var navBarOpaque: Bool {
        get{
            return navBar?.isOpaque ?? true
        }
        set{
            navBar?.isOpaque = newValue
            navBar?.isTranslucent = !newValue
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

extension ViewController: NavigationBarOperation {
    public var navBarNeedsHidden: Bool {
        get{
            return navigationController?.isNavigationBarHidden ?? false
        }
        set{
            navigationController?.setNavigationBarHidden(newValue, animated: false)
        }
    }
    public var navBarShouldPanBack: Bool {
        get{
            return navigationController?.interactivePopGestureRecognizer?.isEnabled ?? true
        }
        set {
            navigationController?.interactivePopGestureRecognizer?.isEnabled = newValue
        }
    }
}
