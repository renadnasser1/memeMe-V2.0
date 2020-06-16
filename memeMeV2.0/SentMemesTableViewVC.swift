//
//  SentMemesTableViewVC.swift
//  memeMeV2.0
//
//  Created by Renad nasser on 13/06/2020.
//  Copyright © 2020 Renad nasser. All rights reserved.
//

import Foundation
import UIKit

// MARK: - SentMemesTableViewVC: UIViewController, UITableViewDataSource, UITableViewDelegate

class SentMemesTableViewVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: -Outlet
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: -Properties
    
    // This is an array of meme instances
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    //MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    //MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memes")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textLabel?.text = meme.topText+" "+meme.bottomText
        cell.imageView?.image = meme.memedImage
        return cell
    }
    
    
    //MARK: - send detial to MemeCustomCell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailVC") as! MemeDetailVC
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    
}

