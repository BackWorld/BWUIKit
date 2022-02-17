//
//  TextInputView.swift
//  BWUIKit
//
//  Created by zhuxuhong on 2022/2/16.
//

import UIKit

open class TextInputView: View {
    public var inputChanged: TextInputChange.Handler?
    public var inputShouldContinue: TextInputContinue.Handler?
    public var inputReturnKeyed: TextInputReturn.Handler?
    @IBInspectable public var placeholderColor: UIColor? = .lightGray
    @IBInspectable public var placeholderText: String?
    @IBInspectable public var maxWords: Int = 0
    @IBInspectable public var minWords: Int = 0
    @IBInspectable public var text: String?
}
