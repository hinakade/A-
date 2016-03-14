//
//  textcomitViewController.swift
//  A!
//
//  Created by KadeHina on 2016/03/12.
//  Copyright © 2016年 KadeHina. All rights reserved.
//

import UIKit

class textcomitViewController: UIViewController {
    
    var scSelectedI1ndex = -1;

    @IBOutlet weak var usecomment: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(scSelectedI1ndex == 0){
            print("眠い")
        usecomment.text = "使い方 \n1スタートボタンを押す。\n2 叫びボタンをクリック。\n3 叫ぶ\n4 叫び終わりをクリック\n5 上にスライド\n6 再生後あなたの叫んだ声が聞こえてきます。\n ※音声機能使います。"
            
            // 背景画像01
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "first_backview.jpg")?.drawInRect(self.view.bounds)
            
            let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()

              self.view.backgroundColor = UIColor(patternImage: image)
        }
//            //セグエ
            if(scSelectedI1ndex == 1){
            var targetView: AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier( "firstview" )
            self.presentViewController( targetView as! FirstViewController, animated: true, completion: nil)
            
        }
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
