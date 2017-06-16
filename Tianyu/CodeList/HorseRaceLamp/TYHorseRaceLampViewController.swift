//
//  TYHorseRaceLampViewController.swift
//  Tianyu
//
//  Created by ChenTianyu on 2017/6/16.
//  Copyright © 2017年 ChenTianyu. All rights reserved.
//

import UIKit
import Foundation

class TYHorseRaceLampViewController: UIViewController {

    var bgLabel : UILabel?
    var contentLabel : UILabel?
    var titleArray = ["星期一","星期二","星期三","星期四","星期五","星期六","星期日"]
    var timer : Timer?
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        let frame = CGRect(x: UIScreen.main.bounds.size.width/2 - 50, y: 100, width: 100, height: 50)
        bgLabel = UILabel(frame: frame)
        bgLabel?.clipsToBounds = true
        bgLabel?.backgroundColor = UIColor.black
        self.view.addSubview(bgLabel!)
        
        contentLabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width/2 - 50, y: 0, width: 100, height: 50))
        contentLabel?.text = titleArray[0]
        contentLabel?.textAlignment = .left
        contentLabel?.textColor = UIColor.orange
        contentLabel?.backgroundColor = UIColor.clear
        contentLabel?.font = UIFont.systemFont(ofSize: 15)
        bgLabel?.addSubview(contentLabel!)
        
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.nextDay), userInfo: nil, repeats: true)
        
        UIView.animate(withDuration: 2.0, delay: 2.0, options: [.curveEaseIn, .repeat], animations: {
            var frame = self.contentLabel?.frame
            frame?.origin.x = (frame?.origin.x)! - (self.bgLabel?.frame.size.width)! - (self.contentLabel?.frame.size.width)!
            self.contentLabel?.frame = frame!
        }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextDay() {
        
        let index = self.count%self.titleArray.count
//        print("index = \(index)")
        self.contentLabel?.text = self.titleArray[index]
        self.count += 1
        if self.count == self.titleArray.count {
            self.count = 0
        }
        
    }
}
