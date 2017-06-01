//
//  TYNameTableViewController.swift
//  Tianyu
//
//  Created by ChenTianyu on 2017/2/3.
//  Copyright © 2017年 ChenTianyu. All rights reserved.
//

import UIKit

class TYNameTableViewController: UITableViewController, UITextFieldDelegate, UINavigationBarDelegate {

    @IBOutlet var name:UITextField?
    
    @IBOutlet var save: UIBarButtonItem?
    
    let oldName : String = UserDefaults.standard.string(forKey: "MyName") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if !oldName.isEmpty {
            name?.text = oldName
        }
        
        save?.isEnabled = false
        name?.becomeFirstResponder()
        
        //直接添加监视
        name?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldDidChange(_ textField: UITextField) {
        
        print("textFieldDidChange ...\(name?.text?.lengthOfBytes(using: String.Encoding.utf8) ?? 0)")
        
        let ssss = name?.text?.lengthOfBytes(using: String.Encoding.utf8)

        let nnn = ssss.flatMap { Int($0) }
        if (nnn! > 0) {
            if oldName != name?.text {
                save?.isEnabled = true
            } else {
                save?.isEnabled = false
            }
        } else {
            save?.isEnabled = false
        }
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("textFieldDidEndEditing")
    }

    
    func textFieldShouldClear(_ textField: UITextField) -> Bool // called when clear button pressed. return NO to ignore (no notifications)
    {
        save?.isEnabled = false
        return true
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(name?.text, forKey: "MyName")
        
//        self.navigationController?.popViewController(animated: true)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        name?.resignFirstResponder()
        
        return true
        
    }
    
}
