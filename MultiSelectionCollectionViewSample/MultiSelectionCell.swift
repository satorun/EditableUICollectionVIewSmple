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
        didSet(oldEditMode) {
            p_view()
        }
    }
    var isSelected:Bool = false {
        didSet(oldSelected) {
            item!.isSelected = isSelected
            p_view()
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
        p_view()
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
    
    func p_view() {
        if isEditMode {
            if isSelected {
                p_selectedViewAtEditMode()
            } else {
                p_unSelectedViewAtEditMode()
            }
        } else {
            if isSelected {
                p_selectedViewAtNormalMode()
            } else {
                p_unSelectedViewAtNormalMode()
            }
        }
    }
    
    func p_selectedViewAtEditMode() {
        button.hidden = false
        backgroundColor = UIColor.blueColor()
    }
    func p_selectedViewAtNormalMode() {
        button.hidden = true
        backgroundColor = UIColor.yellowColor()
    }
    func p_unSelectedViewAtEditMode() {
        button.hidden = false
        backgroundColor = UIColor.whiteColor()
    }
    func p_unSelectedViewAtNormalMode() {
        button.hidden = true
        backgroundColor = UIColor.whiteColor()

    }
}