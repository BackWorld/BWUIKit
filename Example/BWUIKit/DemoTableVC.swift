//
//  ViewController.swift
//  BWUIKit
//
//  Created by 1906457616@qq.com on 01/28/2022.
//  Copyright (c) 2022 1906457616@qq.com. All rights reserved.
//

import BWUIKit
import BWListKit

class DemoTableVC: TableViewController {
    override func didLoad() {
        super.didLoad()
        
        makeListData()
    }
    
    override func didAwake() {
        view.backgroundColor = .red
        tableView.contentInset = .zero
        tableView.backgroundColor = .green
        tableView.separatorStyle = .none
    }
    
    func makeListData() {
        let items: [BWListItem] = (0..<100).map{
            .init(reuseId: Cell.RID, height: 64, data: $0)
        }
        listAdapter.data = .init(registers: [
            .init(style: .cell, class: Cell.self)
        ], sections: [
            .init(items: items)
        ])
    }
}

class Cell: TableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    override func didInit() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override open func bwListItemViewConfigure(_ data: Any?, indexPath: IndexPath) {
        textLabel?.text = "\(data as! Int)"
    }
}
