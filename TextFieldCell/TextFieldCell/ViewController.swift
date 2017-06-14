//
//  ViewController.swift
//  TextFieldCell
//
//  Created by zjkj on 2017/6/2.
//  Copyright © 2017年 zhijiankeji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func demo1Action(_ sender: Any) {
        let v = TxtField1ViewController()
        self.navigationController?.pushViewController(v, animated: true)
    }
    
    @IBAction func demo2Action(_ sender: Any) {
        let v = TxtField2ViewController()
        self.navigationController?.pushViewController(v, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
