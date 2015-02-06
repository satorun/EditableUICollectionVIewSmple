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
    @IBOutlet weak var leadingSpaceConstraint: NSLayoutConstraint!
    
    let kAnimationDuration = 0.4
    var item : ModelItem?
    
    var isEditMode:Bool = false {
        didSet(oldEditMode) {
            p_view(true)
        }
    }
    var isSelected:Bool = false {
        didSet(oldSelected) {
            item!.isSelected = isSelected
            p_view(false)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setData(data: ModelItem) -> Void {
        item = data
        titleLabel.text = item!.title
        isSelected = item!.isSelected!
    }

    func didSelect() {
        if isEditMode {
            isSelected = !isSelected // invert
        } else {
            // 編集モードじゃないときの処理
        }
    }
    
    func p_view(animated: Bool) {
        if isEditMode {
            if isSelected {
                p_selectedViewAtEditMode(animated)
            } else {
                p_unSelectedViewAtEditMode(animated)
            }
        } else {
            if isSelected {
                p_selectedViewAtNormalMode(animated)
            } else {
                p_unSelectedViewAtNormalMode(animated)
            }
        }
    }
    
    func p_selectedViewAtEditMode(animated: Bool) {
        leadingSpaceConstraint.constant = 34
        let duration = animated ? kAnimationDuration : 0
        unowned let unownedSelf = self
        UIView.animateWithDuration(duration, animations: { () -> Void in
            unownedSelf.layoutIfNeeded()
            unownedSelf.button.alpha = 1
            unownedSelf.backgroundColor = UIColor.blueColor()
        })
    }
    func p_selectedViewAtNormalMode(animated: Bool) {
        leadingSpaceConstraint.constant = 0
        let duration = animated ? kAnimationDuration : 0
        unowned let unownedSelf = self
        UIView.animateWithDuration(duration, animations: { () -> Void in
            unownedSelf.layoutIfNeeded()
            unownedSelf.button.alpha = 0
            unownedSelf.backgroundColor = UIColor.yellowColor()
        })
    }
    func p_unSelectedViewAtEditMode(animated: Bool) {
        leadingSpaceConstraint.constant = 34
        let duration = animated ? kAnimationDuration : 0
        unowned let unownedSelf = self
        UIView.animateWithDuration(duration, animations: { () -> Void in
            unownedSelf.layoutIfNeeded()
            unownedSelf.button.alpha = 1
            unownedSelf.backgroundColor = UIColor.whiteColor()

        })
    }
    func p_unSelectedViewAtNormalMode(animated: Bool) {

        leadingSpaceConstraint.constant = 0
        unowned let unownedSelf = self
        let duration = animated ? kAnimationDuration : 0
        UIView.animateWithDuration(duration, animations: { () -> Void in
            unownedSelf.layoutIfNeeded()
            unownedSelf.button.alpha = 0
            unownedSelf.backgroundColor = UIColor.whiteColor()
        })
    }
}