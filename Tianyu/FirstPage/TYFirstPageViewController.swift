//
//  TYFirstPageViewController.swift
//  Tianyu
//
//  Created by ChenTianyu on 2017/5/31.
//  Copyright © 2017年 ChenTianyu. All rights reserved.
//

import UIKit

class TYFirstPageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollViewA: UIScrollView!
    
    @IBOutlet weak var pageControlA: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //tab bar and navigation
        self.automaticallyAdjustsScrollViewInsets = false

        let widths = UIScreen.main.bounds.width
        
        let heights = widths/2
        
        for i in 0...5 {
            
            let iv = UIImageView(frame: CGRect(x: widths * CGFloat(i), y: 0, width: widths, height: heights))
            
            var picName = "s_pic"
            switch i {
            case 0:
                picName += "4"
            case 5:
                picName += "1"
            default:
                picName += i.description
            }
            
//            iv.image = UIImage(named: "s_pic\(i+1)")
            iv.image = UIImage(named: picName)
            iv.contentMode = UIViewContentMode.scaleToFill
            iv.clipsToBounds = true
            iv.isUserInteractionEnabled = true
            self.scrollViewA.addSubview(iv)
        }
        
        self.scrollViewA.contentSize = CGSize(width: widths * 6, height: heights)
        self.scrollViewA.contentOffset = CGPoint(x: widths, y: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == self.scrollViewA {
            let widths = UIScreen.main.bounds.width
            let offsetX = scrollView.contentOffset.x
            
            if offsetX == 0 {
                scrollView.contentOffset = CGPoint(x: widths*CGFloat(4), y: 0)
            }
            
            if offsetX == widths * CGFloat(4+1) {
                scrollView.contentOffset = CGPoint(x: widths, y: 0)
            }
            
            // 此处不能用 offsetX 代替 scrollView.contentOffset.x，这个值在变化
            let currntPage = scrollView.contentOffset.x / widths - 0.5
            
            self.pageControlA.currentPage = Int(currntPage)
            
        }
    }

}
