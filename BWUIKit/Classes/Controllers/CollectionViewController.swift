//
//  CollectionViewController.swift
//  AGF
//
//  Created by zhuxuhong on 2021/1/26.
//

import BWListKit

open class CollectionViewController: ViewController {
    public lazy var listAdapter: BWListAdapter = {
        return BWListAdapter(collectionView: collectionView)
    }()
    
    @IBOutlet public weak var collectionView: CollectionView!{
        get{
            return _collectionView
        }
        set{
            _collectionView = newValue
            listAdapter.collectionView = newValue
        }
    }
    
    private lazy var _collectionView: CollectionView = {
        let v = CollectionView()
        v.frame = view.bounds
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return v
    }()
    
    open override func didLoad() {
        super.didLoad()
        
        view.addSubview(collectionView)
    }
}
