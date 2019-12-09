//
//  ViewController.swift
//  GravityAnimate
//
//  Created by liwei on 2019/11/24.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let viewSize = 15
    
    var animator: UIDynamicAnimator!        // iOS物理环境
    var gravity: UIGravityBehavior!         // iOS重力行为
    var collision: UICollisionBehavior!     // iOS碰撞行为

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior()       // 创建重力行为
        // gravity.angle = 2                   // 下落角度
        // gravity.magnitude = 0.5             // 设置重力加速度
        animator.addBehavior(gravity)       // 添加重力行为到物理环境
        
        collision = UICollisionBehavior()   // 创建碰撞行为
        collision.translatesReferenceBoundsIntoBoundary = true      // 将界面边界添加到碰撞场
        animator.addBehavior(collision)     // 添加碰撞行为到物理环境
    }

    @IBAction func tapAction(_ sender: Any) {
        let x = Int(arc4random() % UInt32(self.view.bounds.width))
        
        let view = UIView(frame: CGRect(x: x, y: 0, width: viewSize, height: viewSize))
        view.backgroundColor = randomColor()
        self.view.addSubview(view)
        
        gravity.addItem(view)               // 添加视图view到重力场
        collision.addItem(view)
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

