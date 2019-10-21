//
//  ViewController.swift
//  4.14_Picker
//
//  Created by 李巍 on 2019/10/20.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var dpDepart: UIDatePicker!
    @IBOutlet weak var tfPersonNum: UITextField!
    @IBOutlet weak var pDestination: UIPickerView!
    
    
    // step2 设置地点选择器
    let arrProvince = ["四川省", "辽宁省", "广东省"]      // 定义城市数据
    let dicCity = [0: ["成都市", "绵阳市", "德阳市"], 1: ["沈阳市", "大连市", "鞍山市"], 2: ["广州市", "深圳市", "珠海市"]]
    var provinceIndex = 0       // 当前选中的省份索引
    var cityIndex = 0           // 当前选中的城市索引
    var arrCitysForSelectedProvince = ["成都市", "绵阳市", "德阳市"]     // 保存对应省份的城市
    
    
    // step4 定义出行人数选择器
    var pPersonNum: UIPickerView!
    
    
    // step5 定义工具条
    var toolBar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // step1 设置日期选择器
        dpDepart.locale = Locale(identifier: "zh")      // 设置时区
        dpDepart.datePickerMode = .date                 // 指定日期选择器模式
        
        // step2 设置目标地点选择器的代理对象
        pDestination.delegate = self
        pDestination.dataSource = self
        
        
        // step 4 构造出行人数选择器
        pPersonNum = UIPickerView(frame: CGRect(x: 0, y: self.view.bounds.height-220, width: self.view.bounds.width, height: 220))
        pPersonNum.delegate = self
        pPersonNum.dataSource = self
        
        
        // step5 构造工具条
        toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 40))
        let bbiPVDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pickerDone))
        let bbiFlexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [bbiFlexible, bbiPVDone]
        
        // step 4 在文本域中弹出人数选择器
        tfPersonNum.inputView = pPersonNum          // 输入视图为选择器
        tfPersonNum.tintColor = UIColor.clear       // 清除b光标
        
        // step5 将工具条放在r输入视图中
        tfPersonNum.inputAccessoryView = toolBar    // 输入的辅助视图
        
        
    }
    
    
    // step 2 设置pickerView数据源
    // MARK: Pikcerview datasource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {       // 设置选择器列数
        // step 2 设置pickerView数据源
        if pickerView == pDestination {     // 如果是目标地点选择器
            return 2
        }
        
        // step 3 设置人数选择器数据源
        if pickerView == pPersonNum {
            return 1
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {    // 设置每列的行数
        // step 2 设置pickerView数据源
        // step 2 设置pickerView数据源
        if pickerView == pDestination {     // 如果是目标地点选择器
            return 3
        }
        
        // step 4 设置人数选择器数据源
        if pickerView == pPersonNum {
            return 5
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {     // 设置每行的内容
        // step 2 设置pickerView数据源
        if pickerView == pDestination { // 如果是目标地点选择器
            if component == 0 {     // 设置第1列省份内容
                return arrProvince[row]
            } else if component == 1 {  // 设置第2列城市内容
                return arrCitysForSelectedProvince[row]
            }
        }
        
        // step 4 设置人数选择器数据源
        if pickerView == pPersonNum {
            return "\(row+1)"
        }
        
        return ""
    }
    
    
    // step 3 设置pickerView的代理
    // MARK: pickerview dalegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {// 选中某行的回调方法
        // step 3 设置pickerView的代理
        if pickerView == pDestination { // 如果是目标地点选择器
            if component == 0 {         // 第一列省份
                provinceIndex = row     // 保存用户选择的省份索引
                arrCitysForSelectedProvince = dicCity[provinceIndex]!        // 更新省份对应的城市数组
                pDestination.reloadComponent(1)         // 重新加载第二列
                pDestination.selectRow(0, inComponent: 1, animated: true)   // 将第二列行设为第一行
            } else if component == 1{   // 第2列城市
                cityIndex = row         // 保存用户选择城市的索引号
            }
        }
        
        // step 4 设置人数选择器的代理
        if pickerView == pPersonNum {
            tfPersonNum.text = "\(row+1)"
        }
    }
    
    
    // step5 toolbar function
    // MARK: toolbar function
    @objc func pickerDone() {
        tfPersonNum.resignFirstResponder()
    }
    
    
    //step6 完成按钮的目标动作方法
    @IBAction func btnDone(_ sender: UIButton) {        //
        var strInfo = "计划"
        
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日"
        strInfo += df.string(from: dpDepart.date)
        
        strInfo += tfPersonNum.text!
        strInfo += "人去"
        
        strInfo += arrProvince[provinceIndex]
        strInfo += arrCitysForSelectedProvince[cityIndex]
        
        // 使用动作表和提醒显示，显示出行计划
        let alertCtrl = UIAlertController(title: "出行计划", message: strInfo, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "好", style: .cancel, handler: nil)
        alertCtrl.addAction(cancelAction)
        present(alertCtrl, animated: true, completion: nil)
    }
}

