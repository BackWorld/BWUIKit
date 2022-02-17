//
//  TextInput.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/13.
//  Copyright © 2020 agoculture. All rights reserved.
//

import UIKit

public enum TextInputStatus {
    case began
    case ended
    case changed
}

public struct TextInputReturn {
    public typealias Handler = (Self)->Bool
    
    public var text: String?
    public var textView: TextView?
    public var textField: TextField?
    public init(text: String?, textView: TextView? = nil, textField: TextField? = nil) {
        self.text = text
        self.textView = textView
        self.textField = textField
    }
}

public struct TextInputContinue {
    public typealias Handler = (Self)->Bool
    
    public var text: String!
    public var range: NSRange!
    public var string: String!
    public var textView: TextView?
    public var textField: TextField?
    public init(range: NSRange, string: String, text: String, textView: TextView? = nil, textField: TextField? = nil){
        self.range = range
        self.string = string
        self.text = text
        self.textView = textView
        self.textField = textField
    }
}

public struct TextInputChange {
    public typealias Handler = (Self)->Void
    
    public var status: TextInputStatus!
    public var text: String?
    public var textView: TextView?
    public var textField: TextField?
    public init(status: TextInputStatus, text: String?, textView: TextView? = nil, textField: TextField? = nil){
        self.status = status
        self.text = text
        self.textView = textView
        self.textField = textField
    }
}
