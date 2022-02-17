//
//  TableViewCell.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/22.
//

import BWListKit

open class TableViewCell: UITableViewCell, ViewAdapter, BWListItemView {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    open func bwListItemViewConfigure(_ data: Any?, indexPath: IndexPath) {
    }
    //MARK: ViewAdapter
    open func didInit(){}
    open func didAwake(){}
    open func willDeinit(){}
}
