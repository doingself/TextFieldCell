//
//  TxtField2ViewController.swift
//  TextFieldCell
//
//  Created by zjkj on 2017/6/2.
//  Copyright © 2017年 zhijiankeji. All rights reserved.
//

import UIKit

class TxtField2ViewController: UIViewController {
    
    fileprivate var tabView: UITableView!
    fileprivate let cellIdentifier = "cellIdentifier"
    fileprivate var txtArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Notification.DidEndEditing"
        self.view.backgroundColor = UIColor.white
        
        for i in 0 ... 10 {
            txtArr.append(String())
        }
        
        let tvc = UITableViewController(style: UITableViewStyle.grouped)
        self.addChildViewController(tvc)
        tvc.view.frame = self.view.frame
        tabView = tvc.tableView
        
        tabView.delegate = self
        tabView.dataSource = self
        tabView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
        
        tabView.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        // 单元格的预估行高
        tabView.estimatedRowHeight = 44.0
        // 自动计算行高
        tabView.rowHeight = UITableViewAutomaticDimension
        self.view.addSubview(tabView)
        
        // 单元格结束编辑通知
        NotificationCenter.default.addObserver(self, selector: #selector(self.txtDidChange(sender:)), name: NSNotification.Name.UITextFieldTextDidEndEditing, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 单元格结束编辑通知
    func txtDidChange(sender: Notification){
        if let txtfield = sender.object as? UITextField{
            let index = txtfield.tag
            let str = txtfield.text
            
            txtArr[index] = str ?? ""
        }
    }
    
}
extension TxtField2ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TextFieldTableViewCell
        
        cell.titleLab.text = String(format: "%d-%d", indexPath.section,indexPath.row)
        let index = indexPath.section * 10 + indexPath.row
        
        cell.txtField.tag = index
        
        cell.txtField.text = txtArr[index]
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
extension TxtField2ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 输出 text
        for i in 0 ..< txtArr.count {
            let txt = txtArr[i]
            let str = " \(i)\t=\t\(txt)"
            print(str)
        }
    }
}
