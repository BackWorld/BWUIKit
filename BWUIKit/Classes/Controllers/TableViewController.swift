//
//  TableViewController.swift
//  BWUIKit
//
//  Created by zhuxuhong on 2022/2/17.
//

import BWListKit

open class TableViewController: ViewController {
    public lazy var listAdapter: BWListAdapter = {
        return BWListAdapter(tableView: tableView)
    }()
    
    @IBOutlet public weak var tableView: TableView!{
        get{
            return _tableView
        }
        set{
            _tableView = newValue
            listAdapter.tableView = newValue
        }
    }
    
    private lazy var _tableView: TableView = {
        let v = TableView()
        v.frame = view.bounds
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return v
    }()
    
    open override func didLoad() {
        super.didLoad()
        
        view.addSubview(tableView)
    }
}
