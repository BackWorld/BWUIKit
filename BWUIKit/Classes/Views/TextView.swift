//
//  TextView.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/13.
//  Copyright © 2020 agoculture. All rights reserved.
//

import YYText

open class TextView: TextInputView {
    public lazy var input: YYTextView = {
        let v = YYTextView(frame: bounds)
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        v.textAlignment = .left
        v.textVerticalAlignment = .top
        v.autocapitalizationType = .none
        v.autocorrectionType = .no
        v.spellCheckingType = .no
        v.enablesReturnKeyAutomatically = true
        v.keyboardType = .default
        v.font = UIFont.systemFont(ofSize: 16)
        v.textColor = .black
        v.placeholderText = "请输入内容..."
        v.placeholderTextColor = v.textColor?.withAlphaComponent(0.4)
        v.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        v.delegate = self
        return v
    }()
    
    open override var placeholderColor: UIColor?{
        didSet{
            input.placeholderTextColor = placeholderColor
        }
    }
    
    open override var tintColor: UIColor! {
        didSet{
            input.tintColor = tintColor
        }
    }
    
    open override func didInit() {
        super.didInit()
        setup()
    }
    open override func didAwake() {
        super.didAwake()
        setup()
    }
    private func setup() {
        addSubview(input)
    }
}

extension TextView: YYTextViewDelegate {
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        input.resignFirstResponder()
    }
    public func textViewDidChange(_ textView: YYTextView) {
        inputChanged?(.init(status: .changed, text: textView.text, textView: self))
    }
    public func textViewDidBeginEditing(_ textView: YYTextView) {
        inputChanged?(.init(status: .began, text: textView.text, textView: self))
    }
    public func textViewDidEndEditing(_ textView: YYTextView) {
        inputChanged?(.init(status: .ended, text: textView.text, textView: self))
    }
    public func textView(_ textView: YYTextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "" {
            return true
        }
        if text == "\n" {
            guard let keyed = inputReturnKeyed else {
                return true
            }
            resignFirstResponder()
            return keyed(.init(text: text, textView: self))
        }
        if maxWords > 0, let text = textView.text, text.count >= maxWords {
            return false
        }
        return inputShouldContinue?(.init(range: range, string: text, text: textView.text, textView: self)) ?? true
    }
}
