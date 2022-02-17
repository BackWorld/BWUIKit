//
//  Stepper.swift
//  RaveLand
//
//  Created by CS001 on 2021/4/14.
//  Copyright © 2021 CSLY. All rights reserved.
//

import UIKit
import SnapKit

open class Stepper: Control {
    open override var tintColor: UIColor! {
        didSet{
            plusBtn.tintColor = tintColor
            minusBtn.tintColor = tintColor
            valueTF.input.textColor = tintColor
        }
    }
    @IBInspectable var minusIcon: UIImage? {
        didSet{
            minusBtn.setImage(minusIcon, for: .normal)
            minusBtn.setTitle(nil, for: .normal)
        }
    }
    @IBInspectable var plusIcon: UIImage? {
        didSet{
            plusBtn.setImage(plusIcon, for: .normal)
            minusBtn.setTitle(nil, for: .normal)
        }
    }
    @IBInspectable var minValue: Int = 0 {
        didSet{
            value = max(value, minValue)
        }
    }
    @IBInspectable var maxValue: Int = .max {
        didSet{
            value = min(value, maxValue)
        }
    }
    @IBInspectable var numberFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet{
            valueTF.input.font = numberFont
        }
    }
    @IBInspectable var stepValue: Int = 1
    @IBInspectable var value: Int = 0 {
        didSet{
            valueTF.text = String(max(minValue, min(value, maxValue)))
            updateUI()
            sendActions(for: .valueChanged)
            valueChanged?(value)
        }
    }
    @IBInspectable var buttonWidth: CGFloat = 40
    @IBInspectable var buttonBgColor: UIColor? = .lightGray {
        didSet{
            minusBtn.backgroundColor = buttonBgColor
            plusBtn.backgroundColor = buttonBgColor
        }
    }
    open var valueChanged: ((Int)->Void)?
    
    /// UIs
    private lazy var valueTF: TextField = {
        let v = TextField()
        v.isUserInteractionEnabled = false
        v.input.textColor = tintColor
        v.input.font = numberFont
        v.input.textAlignment = .center
        return v
    }()
    
    private lazy var plusBtn: UIButton = {
        let v = UIButton(type: .system)
        v.tintColor = tintColor
        v.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        v.setTitle("+", for: .normal)
        v.addTarget(self, action: #selector(plusBtnTapped(_:)), for: .touchUpInside)
        v.backgroundColor = buttonBgColor
        return v
    }()
    
    private lazy var minusBtn: UIButton = {
        let v = UIButton(type: .system)
        v.tintColor = tintColor
        v.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        v.setTitle("-", for: .normal)
        v.addTarget(self, action: #selector(minusBtnTapped(_:)), for: .touchUpInside)
        v.backgroundColor = buttonBgColor
        return v
    }()
    
    @objc private func minusBtnTapped(_ sender: UIButton) {
        value -= stepValue
    }
    @objc private func plusBtnTapped(_ sender: UIButton) {
        value += stepValue
    }
    
    private func updateUI() {
        minusBtn.isEnabled = value > minValue
        plusBtn.isEnabled = value < maxValue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    open override func didInit() {
        setup()
    }
    open override func didAwake() {
        setup()
    }
    
    private func setup(){
        addSubview(minusBtn)
        addSubview(plusBtn)
        addSubview(valueTF)
        minusBtn.snp.makeConstraints{
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(buttonWidth)
        }
        valueTF.snp.makeConstraints {
            $0.left.equalTo(minusBtn.snp.right)
            $0.top.bottom.equalToSuperview()
            $0.right.equalTo(plusBtn.snp.left)
        }
        plusBtn.snp.makeConstraints{
            $0.trailing.top.bottom.equalToSuperview()
            $0.width.equalTo(buttonWidth)
        }
        
        /// 为了触发`didSet`方法
        value = Int(value)
    }
}
