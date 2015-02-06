//
//  MainCollectionViewController.swift
//  MultiSelectionCollectionViewSample
//
//  Created by satorun on 2/3/15.
//  Copyright (c) 2015 satorun. All rights reserved.
//

import UIKit

class MainCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    var itemArray : Array<ModelItem>?
    var isEditMode :Bool = false {
        didSet(oldValue) {
            if isEditMode {
                editButton.title = "完了"
            } else {
                editButton.title = "編集"
            }
            collectionView?.reloadData()
        }
    }
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        collectionView!.delegate = self;
        itemArray = p_makeModelArray()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray!.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:MultiSelectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as MultiSelectionCell
        cell.setData(itemArray![indexPath.row])
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

    func p_makeModelArray() -> Array<ModelItem> {
        var array : Array<ModelItem> = []
        for var i=0;i<100;i++ {
            let item = ModelItem()
            item.title = "item \(i)"
            item.isSelected = false
            array.append(item)
        }
        return array
    }
}
