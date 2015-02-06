//
//  MultiSelectionCell.swift
//  MultiSelectionCollectionViewSample
//
//  Created by satorun on 2/3/15.
//  Copyright (c) 2015 satorun. All rights reserved.
//

import UIKit

class MultiSelectionCell: UICollectionViewCell {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var item : ModelItem?
    
    var isEditMode:Bool = false {
        willSet(newEditMode) {
            println("age willSet:\(isEditMode) -> \(newEditMode)")
        }
        didSet(oldEditMode) {
            println("age didSet :\(oldEditMode) -> \(isEditMode)")
        }
    }
    var isSelected:Bool = false {
        willSet(newSelected) {
            println("age willSet:\(isSelected) -> \(newSelected)")
        }
        didSet(oldSelected) {
            println("age didSet :\(oldSelected) -> \(isSelected)")
            if isSelected {
                item!.isSelected = true
                button.highlighted = true
                backgroundColor = UIColor.blueColor()
            } else {
                item!.isSelected = false
                button.highlighted = false
                backgroundColor = UIColor.whiteColor()
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setData(data: ModelItem) -> Void {
        item = data
        if item!.isSelected! {
            isSelected = true
        } else {
            isSelected = false
        }
        titleLabel.text = item!.title
    }
    
    func toggleSelectState() {
        isSelected = !isSelected // invert
    }
    func didSelect() {
        if isEditMode {
            toggleSelectState()
        } else {
            //toggleSelectState()
        }
    }
}
