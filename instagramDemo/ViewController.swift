//
//  ViewController.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/13/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    let reuseIdentifier = "FeedCell"
    
    var feedArray : Array<Feed> = Array.init()
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.bounds.size
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
        cell.descriptionField.text = feedVM.bodyDescription
        cell.subTitleLabel.text = feedVM.timeCreated
        
        cell.bodyImage.loadImageUsingCacheWithUrl(urlString: (feedVM.bodyImageUrl)!)
        cell.headerImage.loadImageUsingCacheWithUrl(urlString: (feedVM.userProfileImageUrl)!)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let senderFeed = feedArray[indexPath.row]
        self.performSegue(withIdentifier: "DetailViewController", sender: senderFeed)
    }
    
    // MARK: - NewWorking
    
    func getListOfFeed(){
        InstagramUserServce.getListOfFeed(params: ["access_token" : DefaultSettings.sharedInstance.token]) { (feedArray, Error) in
            self.feedArray = feedArray
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - View State
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "FeedCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.collectionView.setContentOffset(CGPoint.zero, animated: false)
        }
        getListOfFeed()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailViewController" {
            let detailVC = segue.destination as! DetailViewController
            detailVC.feed = sender as? Feed
        }
        
    }
    
}

