//
//  ViewControllerAdapter.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/21.
//

import UIKit

public protocol ViewControllerAdapter: ViewAdapter where Self: UIViewController {
    func didLoad()
    func willLayout()
    func didLayout()
    func willAppear()
    func didAppear()
    func willRotate()
    func didRotated(previousTrait: UITraitCollection?, currentTrait: UITraitCollection)
    func willDisapppear()
    func didDisappear()
}
