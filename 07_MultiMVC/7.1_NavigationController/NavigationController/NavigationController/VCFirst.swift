//
//  VCFirst.swift
//  NavigationController
//
//  Created by liwei on 2019/12/4.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class VCFirst: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .yellow
        
        // 界面布局
        let btnNext = UIButton(frame: CGRect(x: 20, y: 100, width: self.view.bounds.width-40, height: 30))
        btnNext.addTarget(self, action: #selector(btnNextAction), for: .touchDown)
        btnNext.setTitle("下一页", for: .normal)
        btnNext.setTitleColor(.black, for: .normal)
        self.view.addSubview(btnNext)
        
        // 设置导航控制器
        self.navigationItem.title = "第一页"   // 设置标题
        // self.title = "第一页"
        
        let btnRight = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navRightBtn))    //创建右侧按钮
        self.navigationItem.rightBarButtonItem = btnRight
        
        let btnLeft = UIBarButtonItem(title: "编辑", style: .done, target: self, action: #selector(navLeftBtn))
        self.navigationItem.leftBarButtonItem = btnLeft
        
    }
    
    @objc func btnNextAction() {
        let vc2 = VCSecond()
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    @objc func navLeftBtn() {
        print("导航栏左侧按钮按下")
    }
    
    @objc func navRightBtn() {
        print("导航栏右侧按钮按下")
    }
}
