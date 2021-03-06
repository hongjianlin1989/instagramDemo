//
//  DetailViewController.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/14/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "FeedCell"
    
    var feed: Feed?
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBAction func closeButtonClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - View State
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "FeedCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return view.bounds.size
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! FeedCell
        let feedVM = FeedCellViewModel.init(inputFeed: feed!)
        cell.nameLabel.text = feedVM.userName
        cell.descriptionField.text = feedVM.bodyDescription
        cell.subTitleLabel.text = feedVM.timeCreated
    
        cell.bodyImage.loadImageUsingCacheWithUrl(urlString: (feedVM.bodyImageUrl)!)
        cell.headerImage.loadImageUsingCacheWithUrl(urlString: (feedVM.userProfileImageUrl)!)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
