//
//  WebView.swift
//  RaveLand
//
//  Created by CS001 on 2021/4/13.
//  Copyright © 2021 CSLY. All rights reserved.
//

import WebKit

open class WebView: WKWebView, ViewAdapter {
    public enum LoadingStatus {
        case started
        case finished
        case invalidUrl(_ url: String)
        case failed(error: Error)
    }
    
    open var loadingHandler: ((LoadingStatus)->Void)?
    
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
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
    open func didAwake() {
        setup()
    }
    open func didInit() {
        setup()
    }
    open func willDeinit() {}
    
    deinit{
        willDeinit()
    }
    
    private func setup(){
        navigationDelegate = self
    }
}

extension WebView: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loadingHandler?(.started)
    }
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loadingHandler?(.failed(error: error))
    }
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingHandler?(.finished)
    }
}

extension WebView {
    public func loadUrl(_ url: String) {
        guard let aURL = URL(string: url) else {
            loadingHandler?(.invalidUrl(url))
            return
        }
        load(.init(url: aURL))
    }
    public func loadHTML(_ html: String, baseURL: URL? = nil) {
        loadHTMLString(html, baseURL: baseURL)
    }
}
