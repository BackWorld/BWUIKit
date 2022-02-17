//
//  DemoPageVC.swift
//  BWUIKit_Example
//
//  Created by zhuxuhong on 2022/2/17.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import BWUIKit

class DemoPageVC: PageViewController {
    
    lazy var page1 = PageVC1()
    lazy var page2 = PageVC2()
    lazy var page3 = PageVC3()
    lazy var page4 = PageVC()
    
    override func didLoad() {
        super.didLoad()
        
        staticPages = [page1, page2, page3, page4]
        setPages([page2])
    }
    
    var idx = 0{
        didSet{
            print("Page: \(idx)")
        }
    }
    override func pageDidChange(page vc: UIViewController) {
        if let vc = vc as? PageVC {
            vc.reloadData()
        }
    }
    
//    override open func pageBefore(page vc: UIViewController) -> UIViewController? {
//        idx -= 1
//        let vc = PageVC1()
//        if !staticPages.contains(vc) {
//            staticPages.append(vc)
//        }
//        return vc
//    }
//
//    override open func pageAfter(page vc: UIViewController) -> UIViewController? {
//        idx += 1
//        return PageVC2()
//    }
}

class PageVC: ViewController {
    override func didLoad() {
        super.didLoad()
        
        print("didLoad page")
        view.backgroundColor = .random
    }
    
    func reloadData() {
        view.backgroundColor = .random
    }
}

class PageVC3: ViewController {
    override func didLoad() {
        super.didLoad()
        
        print("didLoad 3")
        view.backgroundColor = .random
    }
}



class PageVC2: ViewController {
    override func didLoad() {
        super.didLoad()
        
        print("didLoad 2")
        view.backgroundColor = .random
    }
}

class PageVC1: ViewController {
    override func didLoad() {
        super.didLoad()
        
        print("didLoad 1")
        view.backgroundColor = .random
    }
}

extension UIColor  {
    //返回随机颜色
    class var random: UIColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return .init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
