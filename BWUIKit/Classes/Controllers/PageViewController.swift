//
//  PageViewController.swift
//  ASW
//
//  Created by zhuxuhong on 2020/12/28.
//

import UIKit

typealias PagerDelegate = UIPageViewControllerDelegate
typealias PagerDataSource = UIPageViewControllerDataSource
typealias PagerOrientation = UIPageViewController.NavigationOrientation
typealias PagerDirection = UIPageViewController.NavigationDirection
typealias PagerOptions = [String: Any]

open class PageViewController: UIPageViewController, ViewControllerAdapter {
    struct Style {
        var transition: TransitionStyle!
        var orientation: NavigationOrientation!
        var options: PagerOptions?
        init(
            transition: TransitionStyle = .scroll,
            orientation: NavigationOrientation = .horizontal,
            options: PagerOptions? = nil
        ) {
            self.transition = transition
            self.orientation = orientation
            self.options = options
        }
    }
    
    open var staticPages: [UIViewController] = []
    open var currentPage: UIViewController?{
        didSet{
            print(currentPage ?? "")
        }
    }
    open var currentPageIndex: Int? {
        if let vc = currentPage,
            let idx = staticPages.index(of: vc) {
            return idx
        }
        return nil
    }
    
    fileprivate func pageAt(_ index: Int) -> UIViewController? {
        if index < staticPages.count {
            return staticPages[index]
        }
        return nil
    }
    
    public func scrollToPage(_ page: UIViewController) {
        setPages([page])
    }
    
    public func setPages(
        _ pages: [UIViewController],
        direction: UIPageViewControllerNavigationDirection = .reverse,
        animated: Bool = false,
        completion: ((Bool)->Void)? = nil
    ){
        setViewControllers(pages, direction: direction, animated: animated, completion: completion)
        delegate?.pageViewController?(self, didFinishAnimating: true, previousViewControllers: [], transitionCompleted: true)
    }
    
    open func pageDidChange(page vc: UIViewController) {
        
    }
    open func pageBefore(page vc: UIViewController) -> UIViewController? {
        if let idx = staticPages.index(of: vc),
           idx > 0,
            let page = pageAt(idx - 1) {
            return page
        }
        return nil
    }
    open func pageAfter(page vc: UIViewController) -> UIViewController? {
        if let idx = staticPages.index(of: vc),
           idx < staticPages.count-1,
            let page = pageAt(idx + 1) {
            return page
        }
        return nil
    }
    
    convenience init() {
        self.init(style: .init())
    }
    
    convenience init(style: Style) {
        self.init(transitionStyle: style.transition, navigationOrientation: style.orientation, options: style.options)
    }
    
    public override init(
        transitionStyle style: UIPageViewControllerTransitionStyle,
        navigationOrientation: UIPageViewControllerNavigationOrientation,
        options: [String : Any]? = nil
    ) {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
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
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        didLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        willAppear()
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        willLayout()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        didLayout()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didAppear()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        willDisapppear()
    }
    
    deinit {
        willDeinit()
    }
    
    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        willRotate()
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        didRotated(previousTrait: previousTraitCollection, currentTrait: traitCollection)
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
    open func didInit(){}
    open func didAwake(){}
    open func willDeinit(){}
    open func didLoad(){
        delegate = self
        dataSource = self
    }
    open func willLayout(){}
    open func didLayout(){}
    open func willAppear(){}
    open func didAppear(){}
    open func willRotate(){}
    open func didRotated(previousTrait: UITraitCollection?, currentTrait: UITraitCollection){}
    open func willDisapppear(){}
    open func didDisappear(){}
}

extension PageViewController: UIPageViewControllerDataSource {
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return pageBefore(page: viewController)
    }
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return pageAfter(page: viewController)
    }
}

extension PageViewController: UIPageViewControllerDelegate {
    public func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        return .min
    }
    public func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        if finished, completed,
            let page = viewControllers?.first,
            currentPage != page {
            currentPage = page
            pageDidChange(page: page)
        }
    }
}
