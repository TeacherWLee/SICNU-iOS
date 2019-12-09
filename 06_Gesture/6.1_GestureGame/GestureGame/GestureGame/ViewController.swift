//
//  ViewController.swift
//  GestureGame
//
//  Created by liwei on 2019/11/24.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageViewHero: UIImageView!
    let HeroSizeSmall = 50
    let HeroSizeBig = 100
    
    var pointTranslate: CGPoint!
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewHero = UIImageView(frame: CGRect(x: 180, y: 600, width: HeroSizeSmall, height: HeroSizeSmall))
        imageViewHero.image = UIImage(named: "hero0")
        imageViewHero.isUserInteractionEnabled = true
        self.view.addSubview(imageViewHero)
        
        pointTranslate = imageViewHero.center
        
        // 创建拖拽手势
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(panGestureAction(sender:)))
        imageViewHero.addGestureRecognizer(panGesture)
        
        // 创建双击手势
        let doubleTapGesture = UITapGestureRecognizer()
        doubleTapGesture.numberOfTapsRequired = 2
        doubleTapGesture.numberOfTouchesRequired = 1
        doubleTapGesture.addTarget(self, action: #selector(doubleTapGestureAction))
        imageViewHero.addGestureRecognizer(doubleTapGesture)
        
        // 长按手势识别
        let longpressGesture = UILongPressGestureRecognizer()
        longpressGesture.addTarget(self, action: #selector(longpressGestureAction(sender:)))
        imageViewHero.addGestureRecognizer(longpressGesture)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior()
        gravity.magnitude = 0.5
        animator.addBehavior(gravity)
        
        // 创建单击手势
        let singleTapGesture = UITapGestureRecognizer()
        singleTapGesture.addTarget(self, action: #selector(singleTapGestureAction))
        imageViewHero.addGestureRecognizer(singleTapGesture)
    }
    
    // 拖拽手势目标方法
    @objc func panGestureAction(sender: UIPanGestureRecognizer) {
        let translate: CGPoint = sender.translation(in: imageViewHero)    // 获取拖动手势坐标
        
         imageViewHero.center.x = translate.x + pointTranslate.x
         imageViewHero.center.y = translate.y + pointTranslate.y
        
        if sender.state == UIGestureRecognizer.State.ended {
            pointTranslate = imageViewHero.center
        }
    }
    
    // 双击手势目标方法
    @objc func doubleTapGestureAction() {
        if Int(imageViewHero.bounds.size.width) == HeroSizeSmall {
            imageViewHero.frame.size.width = CGFloat(HeroSizeBig)
            imageViewHero.bounds.size.height = CGFloat(HeroSizeBig)
            imageViewHero.center = pointTranslate
        } else {
            imageViewHero.frame.size.width = CGFloat(HeroSizeSmall)
            imageViewHero.bounds.size.height = CGFloat(HeroSizeSmall)
            imageViewHero.center = pointTranslate
        }
    }
    
    // 长按手势目标动作方法
    @objc func longpressGestureAction(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.ended {
            imageViewHero.image = UIImage(named: "hero\(Int(arc4random() % 3))")
        }
    }

    // 单击手势目标方法
    @objc func singleTapGestureAction() {
        for _ in 0..<4 {
            let x = Int(arc4random()%UInt32(self.view.bounds.width-100))
            let y = Int(arc4random()) % 600
            let imageViewEnemy = UIImageView(frame: CGRect(x: x, y: -y, width: 100, height: 100))
            imageViewEnemy.image = UIImage(named: "enemy\(Int(arc4random() % 4))")
            self.view.addSubview(imageViewEnemy)
            
            gravity.addItem(imageViewEnemy)
        }
    }
}

