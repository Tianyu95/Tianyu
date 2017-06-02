//
//  TYProfilePhotoViewController.swift
//  Tianyu
//
//  Created by ChenTianyu on 2017/4/11.
//  Copyright © 2017年 ChenTianyu. All rights reserved.
//

import UIKit

class TYProfilePhotoViewController: UIViewController {

    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var headImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.mainScrollView.contentSize = CGSize.init(width: self.mainScrollView.bounds.width, height: self.mainScrollView.bounds.height)
        
        
        self.mainScrollView.minimumZoomScale = 0.3
        self.mainScrollView.maximumZoomScale = 2.0
        
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
