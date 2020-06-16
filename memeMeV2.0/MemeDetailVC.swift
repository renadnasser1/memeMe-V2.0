//
//  MemeDetailVC.swift
//  memeMeV2.0
//
//  Created by Renad nasser on 15/06/2020.
//  Copyright © 2020 Renad nasser. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailVC: UIViewController {
 
//MARK: Proprites

    var meme:Meme!
 
//MARK: Outlet
    @IBOutlet weak var imageView: UIImageView!
    
    
    
// MARK: Life Cycle
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    self.imageView?.image = self.meme.memedImage
     // self.tabBarController?.tabBar.isHidden = true


  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
     // self.tabBarController?.tabBar.isHidden = false
  }

}
