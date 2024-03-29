//
//  ViewController.swift
//  LabelAnimate
//
//  Created by liwei on 2019/11/5.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let SCREEN_WIDTH = Int(UIScreen.main.bounds.width)
    let SCREEN_HEIGHT = Int(UIScreen.main.bounds.height)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<100 {
            let startX = Int(arc4random()) % SCREEN_WIDTH - 130
            let startY = Int(arc4random()) % SCREEN_HEIGHT

            // 创建标签
            let label = UILabel(frame: CGRect(x: startX, y: startY, width: 130, height: 30))
            label.text = "Hello Teacher Li."
            label.textColor = randomColor()
            self.view.addSubview(label)
            
            // 动画随机位置
            let endX = Int(arc4random()) % SCREEN_WIDTH
            let endY = Int(arc4random()) % SCREEN_HEIGHT
            // 设置动画
            UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse], animations: {
                label.frame.origin = CGPoint(x: endX, y: endY)
                label.alpha = 0
            }) { (Bool) -> () in
                label.alpha = 1
            }
        }
    }
    
    func randomColor() -> UIColor {
        switch arc4random()%7 {
        case 0: return .red
        case 1: return .orange
        case 2: return .yellow
        case 3: return .green
        case 4: return .cyan
        case 5: return .blue
        case 6: return .purple
        default: return .black
        }
    }


}

