//
//  MainCollectionViewController.swift
//  MultiSelectionCollectionViewSample
//
//  Created by satorun on 2/3/15.
//  Copyright (c) 2015 satorun. All rights reserved.
//

import UIKit

class MainCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var isEditMode :Bool = false {
        didSet(oldValue) {
            if isEditMode {
                editButton.title = "完了"
            } else {
                editButton.title = "編集"
            }
            self.collectionView?.reloadData()
        }
    }
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        collectionView!.delegate = self;
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:MultiSelectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as MultiSelectionCell
        cell.isEditMode = isEditMode
        return cell
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var cell :MultiSelectionCell? = collectionView.cellForItemAtIndexPath(indexPath) as?MultiSelectionCell
        cell?.didSelect()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height:CGFloat = 50.0
        let width:CGFloat = (CGFloat)(UIScreen.mainScreen().bounds.width)/2-0.5;
        return CGSizeMake(width, height)
    }
    
    @IBAction func editButtonTapped(sender: AnyObject) {
        isEditMode = !isEditMode
    }

    
}
