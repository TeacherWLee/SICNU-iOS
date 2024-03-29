//
//  ViewController.swift
//  4.13_Alert
//
//  Created by 李巍 on 2019/10/20.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAction(_ sender: UIButton) {
        // 创建动作表
        let alertCtrl = UIAlertController(title: "用手机做什么", message: "选择一下，你计划用手机做什么", preferredStyle: .alert)
        
        // 创建提醒动作
        let actionB = UIAlertAction(title: "看B站", style: .default, handler: nil)
        let actionV = UIAlertAction(title: "追番", style: .default, handler: nil)
        let actionClass = UIAlertAction(title: "看慕课", style: .default) { (actionClass) in
            self.label.text = "欢迎学习iOS课程"           // 提醒动作点击后调用的闭包
        }
        let actionBoom = UIAlertAction(title: "手机自爆", style: .destructive, handler: nil)
        let actionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        
        
        // 将提醒动作添加到动作表中
        alertCtrl.addAction(actionB)
        alertCtrl.addAction(actionV)
        alertCtrl.addAction(actionClass)
        alertCtrl.addAction(actionBoom)
        alertCtrl.addAction(actionCancel)
        
        // 显示动作表
        present(alertCtrl, animated: true, completion: nil)
    }
    
}

