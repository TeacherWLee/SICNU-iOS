//
//  ViewController.swift
//  4.12_TextField
//
//  Created by 李巍 on 2019/10/20.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self               // 设置代理
        
        textField.placeholder = "iPhone 11"     // 设置占位文字
        textField.textColor = .blue             // 设置文字颜色
        //textField.clearsOnBeginEditing = true   // 设置编辑时内容清空
        textField.clearButtonMode = .always     // 设置清除按钮模式
        textField.isSecureTextEntry = true      // 设置密码样式
        
    }

    @IBAction func btnSearch(_ sender: UIButton) {
        label.text = "你搜索的内容是：\(textField.text!)"
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {     // 结束编辑回调方法
        label.text = "你搜索的内容是：\(textField.text!)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {  // 按下返回按钮回调方法
        textField.resignFirstResponder()        // 隐藏键盘
        return true
    }

}

