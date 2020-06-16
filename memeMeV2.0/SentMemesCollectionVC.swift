//
//  SentMemesCollectionVC.swift
//  memeMeV2.0
//
//  Created by Renad nasser on 15/06/2020.
//  Copyright © 2020 Renad nasser. All rights reserved.
//

import UIKit

//MARK: SentMemesCollectionVC: UICollectionViewController

class SentMemesCollectionVC: UICollectionViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var flowLayout : UICollectionViewFlowLayout!
    
    // MARK: - Properties
    // This is an array of meme instances
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set collectionView proprites
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self

        configureLayout(3.0)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Reload data in collection View
        self.collectionView?.reloadData()

    }
    
    //MARK: Cell Layout Helper
    func configureLayout(_ space:CGFloat) {
        let width = (view.frame.size.width - (2 * space)) / 3.0
        let height = (view.frame.size.height - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: width, height: height)
        
    }
    
    // MARK: -Collection View Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memes", for: indexPath) as! MemeCustomCell
        
        let meme = self.memes[(indexPath as NSIndexPath).row ]
        
        // Set the name and image
        cell.image?.image = meme.memedImage
        
        return cell
    }
    
    //MARK:- Send Details to MemeCustomCell
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailVC") as! MemeDetailVC
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    

    
}

