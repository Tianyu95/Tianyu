//
//  TYWebViewController.swift
//  Tianyu
//
//  Created by ChenTianyu on 2017/6/17.
//  Copyright © 2017年 ChenTianyu. All rights reserved.
//

import UIKit
//import Foundation
//import WebKit

enum loadType: Int {
    case internet, pdf, html
    case test
}

class TYWebViewController: UIViewController {

    var webType : loadType = loadType(rawValue: 0)!
    
    var web : UIWebView!
    
    var pathStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.web = UIWebView()
        self.web.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.web)

        let topContraint = NSLayoutConstraint(item: self.web, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0)
        let leftContraint = NSLayoutConstraint(item: self.web, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0.0)
        let rightContraint = NSLayoutConstraint(item: self.web, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0.0)
        let bottomContraint = NSLayoutConstraint(item: self.web, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraints([topContraint, leftContraint, rightContraint, bottomContraint])
//        NSLayoutConstraint.activate([topContraint, leftContraint, rightContraint, bottomContraint])
        
        switch webType {
        case .internet:
            let url = URL(string: pathStr)
            let request = URLRequest(url: url!)
            self.web.loadRequest(request)
            
        case .pdf:
            let file = Bundle.main.path(forResource: pathStr, ofType: "pdf")
            let urlStr = URL.init(fileURLWithPath: file!)
            web.loadRequest(URLRequest(url: urlStr))
            
        case .html:
            
            self.web.loadHTMLString(pathStr, baseURL: nil)
            
        default:
            print("error?")
            break
        }
        
        // Do any additional setup after loading the view.
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

}
