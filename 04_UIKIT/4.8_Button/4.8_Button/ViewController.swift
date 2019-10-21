//
//  ViewController.swift
//  4.8_Button
//
//  Created by 李巍 on 2019/10/16.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnThemeAction(_ sender: UIButton) {
        self.view.backgroundColor = randomColor()
    }
    
    // 随机颜色函数
    func randomColor() -> UIColor {
        let n = arc4random() % 8
        
        switch(n) {
        case 0: return UIColor.red
        case 1: return UIColor.orange
        case 2: return UIColor.yellow
        case 3: return UIColor.green
        case 4: return UIColor.cyan
        case 5: return UIColor.blue
        case 6: return UIColor.purple
        case 7: return UIColor.white
        default: return UIColor.black
        }
    }
    
    
}

