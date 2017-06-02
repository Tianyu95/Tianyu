//
//  TYTouchIdAuthenViewController.swift
//  Tianyu
//
//  Created by ChenTianyu on 2017/6/1.
//  Copyright © 2017年 ChenTianyu. All rights reserved.
//

import UIKit
import LocalAuthentication

class TYTouchIdAuthenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let context = LAContext()
        var error: NSError? = nil
        let canEvaluatePolicy = context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) as Bool
        
        if error != nil {
            print(error!.localizedDescription as String)
        }
        
        if canEvaluatePolicy {
            print("有指纹验证功能")
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "放上您的小指头", reply: { (success: Bool, error: Error?) in
                if success {
                    print("验证成功")
                    self.showprint(str: "验证成功")

                } else {
                    print("验证失败: \(String(describing: error?.localizedDescription))")
                    //print("验证失败: \(error?.localizedDescription)")
                    self.showprint(str: "验证失败: \(String(describing: error?.localizedDescription))")
                }
            })
        } else {
            print("还没开启指纹验证呢")
            self.showprint(str: "还没开启指纹验证呢")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func showprint(str: String) {
        
//        let alertiew = UIAlertController()
//        alertiew.title = "～亲～"
//        alertiew.message = str

        let alertiew = UIAlertController(title: "Hey, Tianyu", message: str, preferredStyle: UIAlertControllerStyle.alert)
        let btn = UIAlertAction(title: "ok", style: UIAlertActionStyle.cancel, handler: nil)
        alertiew.addAction(btn)
        
        present(alertiew, animated: true, completion: nil)
    }
    
}
