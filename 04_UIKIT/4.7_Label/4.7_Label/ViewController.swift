//
//  ViewController.swift
//  4.7_Label
//
//  Created by 李巍 on 2019/10/16.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.backgroundColor = UIColor.yellow    // 设置背景颜色
        myLabel.bounds.size.height = 200            // 设置视图高度（宽度略）
        
        myLabel.text = "Hello Teacher Li.\nA Software Developer."       // 设置标签文字
//        myLabel.numberOfLines = 2                   // 设置行数
        myLabel.numberOfLines = 0                           // 设置多行
        myLabel.textColor = UIColor.blue                    // 设置标签文字颜色
        myLabel.textAlignment = .center                     // 设置标签文字对齐方式
        //myLabel.font = UIFont.systemFont(ofSize: 30)        // 设置标签文字字体大小
        myLabel.font = UIFont(name: "Zapfino", size: 20)    // 设置标签文字字体
        
    }
}

