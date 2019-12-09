//
//  VCFavorites.swift
//  Contacts
//
//  Created by liwei on 2019/12/4.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class VCFavorites: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        print("\(self.view.bounds.width)")
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 64, width: self.view.bounds.width, height: 622))
        imageView.image = UIImage(named: "Favorites_Screenshot")
        self.view.addSubview(imageView)
    }
}
