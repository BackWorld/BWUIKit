//
//  DemoWebViewVC.swift
//  BWUIKit_Example
//
//  Created by zhuxuhong on 2022/2/17.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import BWUIKit

class DemoWebViewVC: ViewController {
    @IBOutlet weak var webview: WebView!
    
    override func didLoad() {
        super.didLoad()
        
        webview.loadUrl("https://www.baidu.com")
    }
}
