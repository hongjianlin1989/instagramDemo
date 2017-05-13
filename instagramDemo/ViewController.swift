//
//  ViewController.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/13/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    @IBOutlet var collectionView: UICollectionView!
    
    let reuseIdentifier = "FeedCell"
    
    var feedArray : Array<Feed> = Array.init()
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 375, height: 500)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! FeedCell
        let feedVM = FeedCellViewModel.init(inputFeed: feedArray[indexPath.row])
        cell.nameLabel.text = feedVM.userName
        cell.descriptionLabel.text = feedVM.bodyDescription
        cell.subTitleLabel.text = feedVM.timeCreated
        
//        cell.layoutIfNeeded()
//        let height = cell.descriptionLabel.frame.size.height + cell.descriptionLabel.frame.origin.y
//        cell.frame.size = CGSize(width: cell.contentView.frame.size.width, height: height)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  
      
    }
    
     // MARK: - NewWorking
    
    func getListOfFeed(){
        
        Feed.getListOfFeed(params: ["access_token" : DefaultSettings.sharedInstance.token]) { (feedArray, Error) in
            self.feedArray = feedArray
            self.collectionView.reloadData()
            
        }
        
    }
    
    // MARK: - View State
    override func viewDidLoad() {
        super.viewDidLoad()
  
        collectionView.register(UINib(nibName: "FeedCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        getListOfFeed()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

