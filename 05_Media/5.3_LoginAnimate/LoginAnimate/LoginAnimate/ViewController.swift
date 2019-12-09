//
//  ViewController.swift
//  LoginAnimate
//
//  Created by liwei on 2019/11/5.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var labelContent: UILabel!
    var isHide = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let btn = UIButton(frame: CGRect(x: 20, y: 50, width: self.view.bounds.width-40, height: 40))
        btn.setTitle("显示内容⇣", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .cyan
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchDown)
        self.view.addSubview(btn)
        
        labelContent = UILabel(frame: CGRect(x: 20, y: 100, width: self.view.bounds.width-40, height: 1))
        labelContent.backgroundColor = .cyan
        labelContent.textAlignment = .center
        self.view.addSubview(labelContent)
    }
    
    @objc func btnAction(_ sender: UIButton) {
        if isHide {
            sender.setTitle("隐藏内容⇡", for: .normal)
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.labelContent.frame.size.height = 200
            }, completion: {
                (Bool) -> () in
                self.labelContent.text = "用户名和密码"
            })
            self.isHide = false
            
        } else {
            sender.setTitle("显示内容⇣", for: .normal)
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.labelContent.frame.size.height = 1
            }, completion: {
                (Bool) -> () in
                self.labelContent.text = ""
            })
            self.isHide = true
        }
    }

}

