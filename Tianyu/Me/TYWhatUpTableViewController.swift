//
//  TYWhatUpTableViewController.swift
//  Tianyu
//
//  Created by ChenTianyu on 2017/2/3.
//  Copyright © 2017年 ChenTianyu. All rights reserved.
//

import UIKit

class TYWhatUpTableViewController: UITableViewController, UITextViewDelegate, UINavigationBarDelegate {

    @IBOutlet var whatUp : UITextView?
    
    @IBOutlet var done: UIBarButtonItem?

    
    @IBOutlet weak var numText: UILabel!
    
    let oldWhatUp : String = UserDefaults.standard.string(forKey: "WhatUp") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        
        //NotificationCenter KVO方式
        NotificationCenter.default.addObserver(self, selector:#selector(textDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
        
        /*
          1、KVO方式 [textField搜索 addObserver:self forKeyPath:@"text" options:0 context:nil]; 
         2、直接添加监视 [textField addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
         3、注册消息通知 [[NSN。
         */
        
        if !oldWhatUp.isEmpty {
            whatUp?.text = oldWhatUp
            
            let num = whatUp?.text?.lengthOfBytes(using: String.Encoding.utf8) ?? 0
                        
            numText.text = String(num)

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textDidChange(_ textView:UITextView) {
        print("writen...")
        
        let num = whatUp?.text?.lengthOfBytes(using: String.Encoding.utf8) ?? 0
        
        print("textDidChange ...\(whatUp?.text?.lengthOfBytes(using: String.Encoding.utf8) ?? 0)")
        
        numText.text = String(num)
        
        let ssss = whatUp?.text?.lengthOfBytes(using: String.Encoding.utf8)
        
        let nnn = ssss.flatMap { Int($0) }
        if (nnn! > 0) {
            if oldWhatUp != whatUp?.text {
                done?.isEnabled = true
            } else {
                done?.isEnabled = false
            }
        } else {
            done?.isEnabled = false
        }

    }

    @IBAction func doneBtn(_ sender: Any) {
        
        UserDefaults.standard.set(whatUp?.text, forKey: "WhatUp")
        
        //        self.navigationController?.popViewController(animated: true)
        
        _ = self.navigationController?.popViewController(animated: true)

    }

}
