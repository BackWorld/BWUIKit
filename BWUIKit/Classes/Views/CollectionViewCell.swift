//
//  CollectionViewCell.swift
//  ASW
//
//  Created by zhuxuhong on 2020/11/22.
//

import BWListKit


open class CollectionViewCell: UICollectionViewCell, BWListItemView, ViewAdapter, ViewTouched
{
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
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touchBegan(touch: touches.first!)
    }
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touchEnded(touch: touches.first!)
    }
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        touchCancelled(touch: touches.first!)
    }
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        touchMoved(touch: touches.first!)
    }
    
    open func bwListItemViewConfigure(_ data: Any?, indexPath: IndexPath) {
    }
    
    //MARK: ViewTouched
    open func touchBegan(touch: UITouch){}
    open func touchEnded(touch: UITouch){}
    open func touchCancelled(touch: UITouch){}
    open func touchMoved(touch: UITouch){}
    
    //MARK: ViewAdapter
    open func didInit(){}
    open func didAwake(){}
    open func willDeinit(){}
}
