//
//  ViewController.swift
//  Image
//
//  Created by liwei on 2019/11/5.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageView: UIImageView!                     // 声明图像视图

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Thread.sleep(forTimeInterval: 2.0)          // 休眠主线程，用于显示启动界面
        
        // 创建图像视图实例
        imageView = UIImageView(frame: CGRect(x: (self.view.bounds.width-200)/2, y: 100, width: 200, height: 200))
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 100
        imageView.layer.masksToBounds = true
        self.view.addSubview(imageView)
        
        // 创建按钮
        let button = UIButton(frame: CGRect(x: 20, y: 350, width: self.view.bounds.width-40, height: 30))
        button.setTitle("请选择头像", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)  // 设置按钮按下的颜色
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(btnSelectImage), for: .touchDown)
    }
    
    // 按钮的目标动作方法c
    @objc func btnSelectImage() {
        // 创建图片选择器
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[.originalImage] as! UIImage
        
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)    // 关闭模态对话框
    }
}

