//
//  AppDelegate.swift
//  Tianyu
//
//  Created by ChenTianyu on 2017/2/1.
//  Copyright © 2017年 ChenTianyu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        Thread.sleep(forTimeInterval: 3.0)

        //当前应用版本号
        let infoDictionary = Bundle.main.infoDictionary
        let currentAppVersion = infoDictionary!["CFBundleShortVersionString"] as! String
        
        //取出之前保存的版本号
        let userDefaults = UserDefaults.standard
        let appVersion = userDefaults.string(forKey: "appVersion")
        
        
        if appVersion == nil || appVersion == currentAppVersion {
            //保存最新版本号
            userDefaults.setValue(currentAppVersion, forKey: "appVersion")
            
            
            //引导页
//            let guideVC = OnboardingContentViewController(title: "Page Title", body: "Page body goes here.", image: UIImage(named: "icon"), buttonText: "Text For Button") { () -> Void in
//
//            self.setupNormalRootViewController()
//                
//            }
//            self.window?.rootViewController = guideVC

            self.window?.rootViewController = self.generateStandardOnboardingVC()
        }
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    func generateStandardOnboardingVC() -> OnboardingViewController {
        
        let firstPage = OnboardingContentViewController(title: "What A Beautiful Photo", body: "This city background image is so beautiful.", image: UIImage(named: "blue"), buttonText: "Enable Location Services") {
        }
        
        let secondPage = OnboardingContentViewController(title: "I'm so sorry", body: "I can't get over the nice blurry background photo.", image: UIImage(named:"red"), buttonText: "Connect With Facebook") {
        }
        secondPage.movesToNextViewController = true

        let thirdPage = OnboardingContentViewController(title: "Seriously Though", body: "Kudos to the photographer.", image: UIImage(named:"yellow"), buttonText: "Get Started") {
            //结束
            self.setupNormalRootViewController()
        }
        
        // Video
        let file = Bundle.main.path(forResource: "video3", ofType: "mp4")
//        let movieURL = URL.init(fileURLWithPath: file!)
        let movieURLbbb = NSURL(fileURLWithPath: file!)
        
        let onboardingVC = OnboardingViewController(backgroundVideoURL: movieURLbbb as URL!, contents: [firstPage, secondPage, thirdPage])
        
        return onboardingVC!
    }
    
  
    
    
    func setupNormalRootViewController() {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        let mainView : UITabBarController = story.instantiateInitialViewController() as! UITabBarController
        self.window?.rootViewController = mainView

    }
}

