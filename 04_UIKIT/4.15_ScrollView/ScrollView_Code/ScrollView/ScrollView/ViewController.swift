//
//  ViewController.swift
//  ScrollView
//
//  Created by 李巍 on 2019/10/27.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置滚动视图的内容尺寸
        scrollView.contentSize = CGSize(width: 3840/2.6, height: 2400/2.6)
        
        // 设置边界回弹效果
        scrollView.bounces = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = true
        
        // 隐藏水平与垂直指示条
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        // 创建一个图片对象
        let image = UIImage(named: "food")
        
        // 创建图片视图对象
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 3840.0 / 2.6, height: 2400.0 / 2.6))
        imageView.image = image
        
        // 将图片视图添加到滚动视图
        scrollView.addSubview(imageView)


    }


}

