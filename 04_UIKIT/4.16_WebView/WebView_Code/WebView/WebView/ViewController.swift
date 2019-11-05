//
//  ViewController.swift
//  WebView
//
//  Created by 李巍 on 2019/10/27.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = UIWebView(frame: UIScreen.main.bounds)
        
        let url = URL(string: "https://www.apple.com/")
        let urlRequest = NSURLRequest(url: url!)
        webView.loadRequest(urlRequest as URLRequest)
        
        self.view.addSubview(webView)
        
    }


}

