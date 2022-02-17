//
//  WebController.swift
//  ASW
//
//  Created by zhuxuhong on 2020/12/9.
//

import WebKit

open class WebController: ViewController {
    @IBOutlet open weak var webView: WebView!{
        get{
            return _webView
        }
        set{
            _webView = newValue
        }
    }
    
    public lazy var _webView: WebView = {
        let v = WebView(frame: view.bounds)
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return v
    }()
    
    open var url: String?
    open var html: String?
    open var baseURL: URL?
    
    convenience init(url: String, title: String = "") {
        self.init()
        self.url = url
        self.title = title
    }
    convenience init(html: String, baseURL: URL? = nil, title: String = "") {
        self.init()
        self.html = html
        self.baseURL = baseURL
        self.title = title
    }
    open override func didLoad() {
        super.didLoad()
        
        view.addSubview(webView)
    }
    
    open override func willAppear() {
        super.willAppear()
        
        reloadRequest()
    }
    
    public func reloadRequest(){
        if let url = url {
            webView.loadUrl(url)
        }
        else if let html = html {
            webView.loadHTML(html, baseURL: baseURL)
        }
    }
    
    open override func willRotate() {
        reloadRequest()
    }
}
