//
//  omakeViewController.swift
//  A!
//
//  Created by KadeHina on 2016/03/12.
//  Copyright © 2016年 KadeHina. All rights reserved.
//

import UIKit

class omakeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var howto = ["使い方","はじめに戻る"]
        @IBOutlet weak var makingCom: UITextView!
    
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // 行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return howto.count
    }
    
    // 表示するセルの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        //cell.textLabel!.text = "\(indexPath.row)行目"
        
        //文字色を茶色にする
        cell.textLabel?.textColor = UIColor.brownColor()
        cell.textLabel!.text = howto[indexPath.row]
        return cell
        
    
        
    }
    //
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row)行目を選択")
         selectedIndex = indexPath.row
        performSegueWithIdentifier("showSecondView", sender: nil)
    }
    
    // Segueで画面遷移する時
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var secondVC = segue.destinationViewController as! textcomitViewController
        secondVC.scSelectedI1ndex = selectedIndex
        
        // 背景画像01
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "first_backview.jpg")?.drawInRect(self.view.bounds)
        
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
    }
}
