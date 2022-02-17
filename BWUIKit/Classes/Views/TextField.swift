//
//  TextField.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/13.
//  Copyright © 2020 agoculture. All rights reserved.
//

import UIKit

open class TextField: TextInputView {
    public lazy var input: UITextField = {
        let v = UITextField(frame: bounds)
        v.delegate = self
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return v
    }()
    
    public override var text: String? {
        get{
            input.text
        }
        set{
            input.text = newValue
        }
    }
    public override var placeholderColor: UIColor?{
        didSet{
            updatePlaceholder()
        }
    }
    public override var placeholderText: String? {
        didSet{
            updatePlaceholder()
        }
    }
    open override func didInit() {
        setupViews()
    }
    open override func didAwake() {
        setupViews()
    }
    private func setupViews(){
        addSubview(input)
        updatePlaceholder()
        input.text = text
    }
    private func updatePlaceholder(){
        let str = input.attributedPlaceholder?.string ?? placeholderText ?? "Default placeholder..."
        let color = placeholderColor ?? UIColor.black.withAlphaComponent(0.4)
        input.attributedPlaceholder = NSAttributedString(string: str, attributes: [
            .foregroundColor: color
        ])
    }
}

extension TextField: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        inputChanged?(.init(status: .began, text: text, textField: self))
    }
    public func textFieldDidEndEditing(_ textField: UITextField) {
        inputChanged?(.init(status: .ended, text: text, textField: self))
    }
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        if string == "\n" {
            guard let keyed = inputReturnKeyed else {
                resignFirstResponder()
                return false
            }
            return keyed(.init(text: text, textField: self))
        }
        if maxWords > 0, let text = textField.text, text.count >= maxWords {
            return false
        }
        return inputShouldContinue?(.init(range: range, string: string, text: text ?? "", textField: self)) ?? true
    }
}
