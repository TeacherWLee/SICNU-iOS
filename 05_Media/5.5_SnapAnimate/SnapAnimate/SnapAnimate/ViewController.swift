//
//  ViewController.swift
//  SnapAnimate
//
//  Created by liwei on 2019/11/24.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator: UIDynamicAnimator!            // iOS物理环境
    var collision: UICollisionBehavior!         // iOS碰撞行为

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        collision = UICollisionBehavior()
        animator.addBehavior(collision)
    }

    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        let randomX = Int(arc4random()%UInt32(self.view.bounds.width))
        let randomY = Int(arc4random()%UInt32(self.view.bounds.height))
        let view = UIView(frame: CGRect(x: randomX, y: randomY, width: 15, height: 15))
        view.backgroundColor = randomColor()
        self.view.addSubview(view)
        
        collision.addItem(view)
        let snap = UISnapBehavior(item: view, snapTo: sender.location(in: self.view))   // 创建吸附行为
        animator.addBehavior(snap)
    }
    
    func randomColor() -> UIColor {
        switch arc4random() % 7 {
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

