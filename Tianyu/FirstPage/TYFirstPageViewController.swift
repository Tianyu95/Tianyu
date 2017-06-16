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
    var timer: Timer?

    
    @IBOutlet weak var horseBgLabel: UILabel!
    var contentLabel : UILabel?
    var timeHorse : Timer?
    var count = 0
    var titleArray = ["美媒：建造世界最大望远镜计划掀起争论",
                      "开车必备！新手上路的35个驾驶技巧！",
                      "每天一万步，向着夏日好身材，一起动起来！",
                      "10.5英寸iPad Pro实测支持29W快充.",
                      "时间顺流而下，生活逆流而上...",
                      "80%的时间都是和搭建页面。",
                      "写业务逻辑、网络请求打交道。",
                      "世界最大4K电视：262英寸屏幕 重1600斤！"]
    
    
    
    
    
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
        
        
        
        //horse Race Lamp//////////////////////
        contentLabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width, y: 0, width: self.horseBgLabel.frame.size.width, height: self.horseBgLabel.frame.size.height))
        contentLabel?.text = titleArray[0]
        contentLabel?.textAlignment = .left
        contentLabel?.textColor = UIColor.black
        contentLabel?.font = UIFont.systemFont(ofSize: 20)
        horseBgLabel.addSubview(contentLabel!)
        
        self.timeHorse = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.nextLabel), userInfo: nil, repeats: true)
        UIView.animate(withDuration: 4.0, delay: 4.0, options: [.curveEaseIn, .repeat], animations: {
            var frame = self.contentLabel?.frame
            frame?.origin.x = (frame?.origin.x)! - self.horseBgLabel.frame.size.width - (self.contentLabel?.frame.size.width)!
            self.contentLabel?.frame = frame!
        }, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.startTimer()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.stopTimer()
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

    //开始拖拽时停止定时器
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.pauseScroll()
        self.stopTimer()
    }
    
    //拖拽结束后开启定时器
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.startTimer()
    }
    
    //开启定时器
    func startTimer() {
        self.stopTimer()
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.nextImage), userInfo: nil, repeats: true)
    }
    
    //关闭定时器
    func stopTimer() {
        if timer != nil && (timer?.isValid)! {
            timer?.invalidate()
            timer = nil
        }
    }
    
    /// 滚动到下一张图片
    func nextImage()
    {
        let offsetX = scrollViewA.contentOffset.x
        self.scrollViewA.setContentOffset(CGPoint(x: offsetX + UIScreen.main.bounds.width, y:0), animated: true)
    }

    ///停止滚动
    func pauseScroll()
    {
//        let offset = self.scrollViewA!.contentOffset.x;
//        let index = offset / self.widths!
//        //1表示没有滚动
//        if index == 1
//        {
//            return
//        }
//        self.currentIndex = self.nextIndex
//        self.pageControlA?.currentPage = self.currentIndex!
//        self.currentView?.frame = CGRect(x: self.imgWidth!, y: 0, width: self.imgWidth!, height: self.imgHeight!)
//        self.currentView?.backgroundColor = self.nextView?.backgroundColor
//        self.scrollView?.contentOffset = CGPoint(x: imgWidth!, y: 0)
    }
    
    
    
    func nextLabel()  {
        let index = self.count % self.titleArray.count
        self.contentLabel?.text = self.titleArray[index]
        self.count += 1
        if self.count == self.titleArray.count {
            self.count = 0
        }
        
    }
}
