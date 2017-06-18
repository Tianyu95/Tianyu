//
//  TYCodeListTableViewController.swift
//  Tianyu
//
//  Created by ChenTianyu on 2017/6/1.
//  Copyright © 2017年 ChenTianyu. All rights reserved.
//

import UIKit

class TYCodeListTableViewController: UITableViewController {

    let listName = ["指纹解锁","获取系统权限","缩放动画","跑马灯展示","k线走势"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        print(listName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = listName[indexPath.row]
        return cell
    }
 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0://指纹解锁
            let touchPage:TYTouchIdAuthenViewController = TYTouchIdAuthenViewController()
            touchPage.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(touchPage, animated: true)
            break
            
        case 1://获取系统权限
            let authPage:TYSetAuthorizationViewController = TYSetAuthorizationViewController()
            authPage.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(authPage, animated: true)
            break
            
        case 2://缩放动画
            let suofang = TYSuofangViewController()
            suofang.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(suofang, animated: true)
            
            break
            
        case 3://跑马灯展示
            let horsePage = TYHorseRaceLampViewController()
            horsePage.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(horsePage, animated: true)
            
            break
            
        case 4://
            /*
             UIStoryboard *story = [UIStoryboard storyboardWithName:@"XMessage" bundle:nil];
             EZChatVC *page = [story instantiateViewControllerWithIdentifier:@"ezchatvc"];

             */
//            let story = UIStoryboard(name: "ListStoryboard", bundle: nil)
//            
//            let stockChatPage:TYStockChatViewController = story.instantiateViewController(withIdentifier: "stockchat") as! TYStockChatViewController
//            
//            stockChatPage.hidesBottomBarWhenPushed = true
//            self.navigationController?.pushViewController(stockChatPage, animated: true)

            break
            
        default:
            return
        }
        
        print(indexPath.row)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
